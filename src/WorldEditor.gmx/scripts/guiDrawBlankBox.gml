//////////////////////////////////////////////////////
//                  guiDrawBlankBox(element ID);
//
//              draws a gui element
//            using it's local variables
//
//          COPYRIGHT 2014 (C) Monkey Studios
//////////////////////////////////////////////////////
var elID, xx, yy, xx2, yy2, colMed, colLight, colDark, rad, text, textcol, font, colDarkest, lighter, darker, width, height;
elID = argument0;

lighter = 100;
darker = 50;
xx = elID.x-x;
yy = elID.y-y;
xx2 = xx+elID.myWidth;
yy2 = yy+elID.myHeight;
width = elID.myWidth;
height = elID.myHeight;
rad = elID.myCornerRadius;



        colMed = elID.myColor;
        //if (elID.myPressed)
            //colMed = c_dkgray;

    
    colLight = make_color_rgb(min(color_get_red(colMed)+lighter,255),min(color_get_green(colMed)+lighter,255),min(color_get_blue(colMed)+lighter,255));
    //colDark is darker than the base
    colDark = make_color_rgb(max(color_get_red(colMed)-darker,0),max(color_get_green(colMed)-darker,0),max(color_get_blue(colMed)-darker,0));
    colDarkest = make_color_rgb(max(color_get_red(colMed)-darker-darker,0),max(color_get_green(colMed)-darker-darker,0),max(color_get_blue(colMed)-darker-darker,0));
    
    
    //box
        draw_set_alpha(elID.myAlpha_Back);
        draw_roundrect_color_ext(xx,yy,xx+width,yy+height,rad,rad,colMed,colMed,false);
        draw_set_alpha(elID.myAlpha_Border);
        draw_set_color(colLight);
        //draw_rectangle(xx+2,yy+2,xx+width-2,yy+(height/2),false);
        draw_roundrect_ext(xx-1,yy-1,xx+width+1,yy+height+1,rad,rad,true);
        draw_roundrect_ext(xx-0.5,yy-0.5,xx+width+0.5,yy+height+0.5,rad,rad,true);
        draw_set_color(colMed);
        draw_roundrect_ext(xx,yy,xx+width,yy+height,rad,rad,true);
        draw_set_color(colDarkest);
        draw_roundrect_ext(xx+1,yy+1,xx+width-1,yy+height-1,rad,rad,true);


///////////////// SPRITE /////////////////////
if (elID.sprite_index > -1) {
    if (elID.mySpritePos == GUI_SPRITE_BT) {
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)-(string_width(elID.myText)*0.30)),round(yy+(height/2)));
    }
    if (elID.mySpritePos == GUI_SPRITE_AT) {
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)+(string_width(elID.myText)*0.30)),round(yy+(height/2)));
    }
    if (elID.mySpritePos == GUI_SPRITE_CENTER) {
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)),round(yy+(height/2)));
    }
}
draw_set_alpha(1);
