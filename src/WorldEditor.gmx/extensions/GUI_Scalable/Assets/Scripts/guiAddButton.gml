///////////////////////////////////////////////////////////////
// guiAddButton(guiID, x1,y1,x2,y2,col,text, textcol, font);
//
//      creates a button and ads it to the guiID
//          and returns the buttons ID
//          text and textcol are optional
//
//          COPYRIGHT 2014 (C) Monkey Studios
///////////////////////////////////////////////////////////////
var guiID, x1, y1, x2, y2, col, text, textcol, butID;
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
butID = instance_create(x1,y1,objGUIButton);
butID.myWidth = max(x1,x2)-min(x1,x2);
butID.myHeight = max(y1,y2)-min(y1,y2);
butID.myColor = col;
butID.myText = text;
butID.myTextCol = textcol;
butID.myGUI = guiID;
butID.myFont = font;
butID.myType = GUI_TYPE_BUTTON; //zero is button
butID.myStateChange = true;
butID.myPressed = false;
butID.myReleased = false;
butID.myPressedCol = c_dkgray;
butID.myTextStretched = false;
butID.myTextPos = 5;
//butID.mySprite = -1;
butID.mySpritePos = GUI_SPRITE_CENTER;
butID.myOnlyText = false;
butID.myCornerRadius = 10;
butID.myAlpha_Back = 1;
butID.myAlpha_Border = 1;
butID.myAlpha_Text = 1;
butID.myCustomScript = " ";
ds_list_add(guiID.myDrawList,butID);

butID.ELID = guiGetIndex(guiID, butID);

return butID;
