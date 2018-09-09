//////////////////////////////////////////////////////////
// drawBox(x,y, width, height, color, text, textcol, font);
//
//              draws a button
//              text optional
//
//          COPYRIGHT 2014 (C) Monkey Studios
//////////////////////////////////////////////////////////
var xx, yy, xx2, yy2, colMed, colLight, colDark, rad, text, textcol, font, colDarkest;
xx = argument0;
yy = argument1;
width = argument2;
height = argument3;
colMed = argument4;
if (argument_count > 5) {
    text = argument5;
    textcol = argument6;
    font = argument7;
} else {
    text = " ";
    textcol = c_black;
    font = fontNormal;
}

rad = 10;
var lighter, darker;
lighter = 100;
darker = 50;
//colLight is lighter than the base
colLight = make_color_rgb(min(color_get_red(colMed)+lighter,255),min(color_get_green(colMed)+lighter,255),min(color_get_blue(colMed)+lighter,255));
//colDark is darker than the base
colDark = make_color_rgb(max(color_get_red(colMed)-darker,0),max(color_get_green(colMed)-darker,0),max(color_get_blue(colMed)-darker,0));
colDarkest = make_color_rgb(max(color_get_red(colMed)-darker-darker,0),max(color_get_green(colMed)-darker-darker,0),max(color_get_blue(colMed)-darker-darker,0));
draw_roundrect_color_ext(xx,yy,xx+width,yy+height,rad,rad,colMed,colMed,false);
draw_set_color(colLight);
//draw_rectangle(xx+2,yy+2,xx+width-2,yy+(height/2),false);
draw_roundrect_ext(xx-1,yy-1,xx+width+1,yy+height+1,rad,rad,true);
draw_roundrect_ext(xx-0.5,yy-0.5,xx+width+0.5,yy+height+0.5,rad,rad,true);
draw_set_color(colMed);
draw_roundrect_ext(xx,yy,xx+width,yy+height,rad,rad,true);
draw_set_color(colDarkest);
draw_roundrect_ext(xx+1,yy+1,xx+width-1,yy+height-1,rad,rad,true);
if (text != " ") {
    draw_set_font(font);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(textcol);
    draw_text(xx+(width/2),yy+(height/2),text);
    //draw_text_transformed(xx+(width/2),yy+(height/2),text,(width*0.8)/string_width(text),(height*0.6)/string_height(text),0);
}
