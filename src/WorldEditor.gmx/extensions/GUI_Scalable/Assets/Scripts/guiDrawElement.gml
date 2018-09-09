//////////////////////////////////////////////////////
//                  drawElement(element ID);
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
xx = round(elID.x-x);
yy = round(elID.y-y);
xx2 = round(xx+elID.myWidth);
yy2 = round(yy+elID.myHeight);
width = elID.myWidth;
height = elID.myHeight;
rad = elID.myCornerRadius;

colMed = elID.myColor;

    colLight = make_color_rgb(min(color_get_red(colMed)+lighter,255),min(color_get_green(colMed)+lighter,255),min(color_get_blue(colMed)+lighter,255));
    //colDark is darker than the base
    colDark = make_color_rgb(max(color_get_red(colMed)-darker,0),max(color_get_green(colMed)-darker,0),max(color_get_blue(colMed)-darker,0));
    colDarkest = make_color_rgb(max(color_get_red(colMed)-darker-darker,0),max(color_get_green(colMed)-darker-darker,0),max(color_get_blue(colMed)-darker-darker,0));

if (!elID.myOnlyText) {
    if (elID.myType == GUI_TYPE_BUTTON && elID.myPressed) {
        colMed = colLight;
        colLight = c_black;
        colDarkest = colDark;
        width += 4;
        height += 4;
        xx -= 2;
        yy -= 2;
    } else {
        xx+= 2;
        yy += 2;
        width -= 4;
        height -= 4;
        colMed = elID.myColor;
    }
    
    
    //button
    if (elID.myType == GUI_TYPE_BUTTON) {
        draw_set_color(colMed);
        /*draw_rectangle(xx,yy,xx+width,yy+height,true);
        draw_rectangle(xx+1,yy+1,xx+width-1,yy+height-1,true);
        draw_rectangle(xx-1,yy-1,xx+width+1,yy+height+1,true);*/
        drawTag(xx,yy,width,height);
        //drawTag(xx+1,yy+1,width-2,height-2);
        
        //stripes
        
        if (elID.myArrow) {
            draw_set_color(c_white);
            //drawPattern(xx+2,yy+2,xx+width,yy+height,2,PAT_STRIPES);
            draw_sprite_ext(sprGUIArrow,0,round(xx+(width*0.9)),round(yy+height/2),scale/2,scale/2,0,c_white,1);
        } else {
            draw_set_color(colDark);
            //drawPattern(xx+2,yy+2,xx+width,yy+height,2,PAT_STRIPES);
        }
    }
    
    //box
    if (elID.myType == GUI_TYPE_BOX || elID.myType == GUI_TYPE_TEXT) {
        draw_set_alpha(elID.myAlpha_Back);
        draw_set_color(colMed);
        draw_rectangle(xx,yy,xx+width,yy+height,false);
        draw_set_alpha(elID.myAlpha_Border);
        if (colMed == c_white) {
            draw_set_color(c_black);
        }
        draw_rectangle(xx,yy,xx+width,yy+height,true);
        draw_rectangle(xx+1,yy+1,xx+width-1,yy+height-1,true);
        draw_rectangle(xx-1,yy-1,xx+width+1,yy+height+1,true);
    }
}

draw_set_font(elID.myFont);
draw_set_color(elID.myTextCol);
draw_set_alpha(1);
///////////////// SPRITE /////////////////////
if (elID.sprite_index > -1 && elID.sprite_index != sprPixel) {
    if (elID.mySpritePos == GUI_SPRITE_BT) {
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)-(string_width(elID.myText)*0.30)),round(yy+(height/2)));
    }
    if (elID.mySpritePos == GUI_SPRITE_AT) {
        //draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)+(string_width(elID.myText)+sprite_get_width(elID.sprite_index))),round(yy+(height/2)));
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(string_width(elID.myText)+sprite_get_width(elID.sprite_index)))+2,round(yy+(height/2))+2);
    }
    if (elID.mySpritePos == GUI_SPRITE_CENTER) {
        draw_sprite(elID.sprite_index,elID.image_index,round(xx+(width/2)),round(yy+(height/2)));
    }
}
draw_set_alpha(elID.myAlpha_Back);

///////////////// TEXT //////////////////////
if (elID.myText != " ") {
    if (elID.sprite_index > -1) {
        if (elID.mySpritePos == GUI_SPRITE_BT) {
            xx += sprite_get_width(elID.sprite_index)*.6;
        }
        if (elID.mySpritePos == GUI_SPRITE_AT) {
            //show_message(string(sprite_get_width(elID.sprite_index)*5));
            xx -= sprite_get_width(elID.sprite_index)*.6;
        }
    }
    
    if (elID.myTextStretched) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(elID.myAlpha_Text);
        draw_text_transformed(xx+round(width/2),yy+round(height/2),elID.myText,round((width*0.9)/string_width(elID.myText)),round((height*0.95)/string_height(elID.myText)),0);
        draw_set_alpha(1);
        exit;
    }
    //draw_set_font(elID.myFont);
    //draw_set_color(elID.myTextCol);
    if (elID.myTextPos == 1) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height*0.05))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height*0.05)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 2) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width/2)),round(yy+(height*0.05))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width/2)),round(yy+(height*0.05)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 3) {
        draw_set_halign(fa_right);
        draw_set_valign(fa_top);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height*0.05))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height*0.05)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 4) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height/2))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height/2)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 5) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width/2)),round(yy+(height/2))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width/2)),round(yy+(height/2)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 6) {
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height/2))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height/2)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 7) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_bottom);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height*0.95))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.05)),round(yy+(height*0.95)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 8) {
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width/2)),round(yy+(height*0.95))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width/2)),round(yy+(height*0.95)),elID.myText,scale/2,scale/2,0);
    }
    if (elID.myTextPos == 9) {
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_set_alpha(elID.myAlpha_Text);
        draw_set_color(c_black);
        if (myTextShadows)
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height*0.95))+1,elID.myText,scale/2,scale/2,0);
        draw_set_color(elID.myTextCol);
        draw_text_transformed(round(xx+(width*0.95)),round(yy+(height*0.95)),elID.myText,scale/2,scale/2,0);
    }
    //draw_text_transformed(xx+(width/2),yy+(height/2),text,(width*0.8)/string_width(text),(height*0.6)/string_height(text),0);
}
draw_set_alpha(1);
