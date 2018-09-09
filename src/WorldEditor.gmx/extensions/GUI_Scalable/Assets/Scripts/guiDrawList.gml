//////////////////////////////
//  guiDrawList(guiObj);
//  draws a list obj
//////////////////////////////

var guiObj, xx, yy, i, surf;

guiObj = argument0;
xx = guiObj.x-x;
yy = guiObj.y-y;

guiDrawBlankBox(guiObj);

var colMed, colLight, colDark, colDarkest, lighter, darker;
lighter = 100;
darker = 50;
colMed = guiObj.myColor;
colLight = make_color_rgb(min(color_get_red(colMed)+lighter,255),min(color_get_green(colMed)+lighter,255),min(color_get_blue(colMed)+lighter,255));
//colDark is darker than the base
colDark = make_color_rgb(max(color_get_red(colMed)-darker,0),max(color_get_green(colMed)-darker,0),max(color_get_blue(colMed)-darker,0));
colDarkest = make_color_rgb(max(color_get_red(colMed)-darker-darker,0),max(color_get_green(colMed)-darker-darker,0),max(color_get_blue(colMed)-darker-darker,0));

var xoff;
    xoff = 10;
if (guiObj.myText != " ") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(guiObj.myAlpha_Text);
    draw_set_font(guiObj.myFont);
    draw_set_color(guiObj.myTextCol);
    draw_text(round(xx+(guiObj.myWidth/2)),round(yy+(string_height(guiObj.myText)/2)),guiObj.myText);
    draw_set_color(colDarkest);
    draw_line(xx+xoff,yy+string_height(guiObj.myText)-1,xx+guiObj.myWidth-xoff,yy+string_height(guiObj.myText));
}
if (guiObj.myText != " ") {
    surf = surface_create(guiObj.myWidth-(xoff*2),guiObj.myHeight-xoff-string_height(guiObj.myText));
} else {
    surf = surface_create(guiObj.myWidth-(xoff*2),guiObj.myHeight-(xoff*2));
}

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(colLight);
/*if (guiObj.myText == " ") {
    draw_rectangle(xx+xoff,yy+xoff,xoff+xx+guiObj.myWidth-(xoff*2),xoff+yy+guiObj.myHeight-(xoff*2),true);
} else {
    draw_rectangle(xx+xoff,yy+xoff+string_height(guiObj.myText),xoff+xx+guiObj.myWidth-(xoff*2),xoff+yy+guiObj.myHeight-(xoff*2),true);
}*/
surface_reset_target();
surface_set_target(surf);
draw_clear_alpha(c_white,0);
if (ds_list_size(guiObj.myList) > 0) {
    for (i=0;i<ds_list_size(guiObj.myList);i++) {
        var x1, y1, x2, y2;
        x1 = 0;
        x2 = guiObj.myWidth-(xoff*2);
        y1 = (i*guiObj.myListSep)-guiObj.myListOffset;
        y2 = ((i+1)*guiObj.myListSep)-guiObj.myListOffset;
        if (guiObj.myListType == 0 && guiObj.myPressed && (abs(guiObj.myPressY[0]-guiObj.myPressY[1]) < 10)) {
            draw_set_color(colDark);
            draw_rectangle(x1,y1+2,x2,y2,false);
        }
        if (guiObj.myListType == 1 && guiObj.myReleased == i) {
            draw_set_color(colDark);
            draw_rectangle(x1,y1+2,x2,y2,false);
        }
        if (guiObj.myListType == 2 && guiList_CheckSelected(guiObj,i)) {
            draw_set_color(colDark);
            draw_rectangle(x1,y1+2,x2,y2,false);
        }
        draw_set_color(guiObj.myTextCol);
        var tempstr, tempindx;
        tempindx = ds_list_find_value(guiObj.myList,i);
        //tempindx = ds_list_find_value(guiObj.myList,0);
        tempstr = stringChop(tempindx,"\e");
        //tempstr = "text";
        draw_text(xoff,round(y1+(guiObj.myListSep/2)),tempstr);
        if (guiObj.myListDrawSep) {
            draw_set_color(colLight);
            draw_line(0,y2,guiObj.myWidth-(xoff*2),y2);
            draw_set_color(colDarkest);
            draw_line(0,y2+1,guiObj.myWidth-(xoff*2),y2+1);
        }
    }
}
surface_reset_target();
surface_set_target(mySurf);
if (guiObj.myText != " ") {
    draw_surface(surf,xx+xoff,yy+string_height(guiObj.myText));
} else {
    draw_surface(surf,xx+xoff,yy+xoff);
}
surface_free(surf);
