///////////////////////////////////////////////////////
// guiAddBox(guiID, x1,y1,x2,y2,col,text, textcol, font);
//
//      creates a button and ads it to the guiID
//          and returns the buttons ID
//          text and textcol are optional
//
//          COPYRIGHT 2014 (C) Monkey Studios
////////////////////////////////////////////////////////
var guiID, x1, y1, x2, y2, col, text, textcol, font, butID;
guiID = argument[0];
x1 = argument[1];
y1 = argument[2];
x2 = argument[3];
y2 = argument[4];
col = argument[5];
if (argument_count > 6) {
    text = argument[6];
    textcol = argument[7];
    font = argument[8];
} else {
    text = " ";
    textcol = c_black;
    font = fontNormal;
}
draw_set_font(font);
//x2 = string_width(text)+64;
//y2 = string_height(text)+16;
butID = instance_create(x1,y1,objGUIBox);
butID.myWidth = x2-x1;
butID.myHeight = y2-y1;
butID.myColor = col;
butID.myText = text;
butID.myTextCol = textcol;
butID.myGUI = guiID;
butID.myFont = font;
butID.myTextStretched = false;
butID.myTextPos = 5;
//butID.mySprite = -1;
butID.mySpritePos = GUI_SPRITE_CENTER;
butID.myOnlyText = false;
butID.myStateChange = true;
butID.myCornerRadius = 10;
butID.myGUI = guiID;
butID.myPressed = false;
butID.myReleased = false;
butID.myPressedCol = c_dkgray;
butID.myType = GUI_TYPE_BOX; //one is box
butID.myAlpha_Back = 1;
butID.myAlpha_Border = 1;
butID.myAlpha_Text = 1;
butID.myCustomScript = " ";
ds_list_add(guiID.myDrawList,butID);

butID.ELID = guiGetIndex(guiID, butID);

return butID;
