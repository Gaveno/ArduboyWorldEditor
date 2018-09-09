///////////////////////////////////////////////////////
// guiAddList(guiID, x1,y1,x2,y2,col, type);
//
//      creates a button and ads it to the guiID
//          and returns the buttons ID
//          text and textcol are optional
//
//      List types are:
//      0 = button list | GUI_LIST_BUTTON
//      1 = single highlight list | GUI_LIST_SINGLE
//      2 = multiple highlight list | GUI_LIST_MULTIPLE
//      
//      COPYRIGHT 2014 (C) Monkey Studios
////////////////////////////////////////////////////////
var guiID, x1, y1, x2, y2, col, text, textcol, font, butID, type;
guiID = argument[0];
x1 = argument[1];
y1 = argument[2];
x2 = argument[3];
y2 = argument[4];
col = argument[5];
type = argument[6];
    text = " ";
    textcol = c_black;
    font = fontNormal;

draw_set_font(font);
//x2 = string_width(text)+64;
//y2 = string_height(text)+16;
butID = instance_create(x1,y1,objGUIList);
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
butID.myCornerRadius = 1;
butID.myGUI = guiID;
butID.myPressed = false;
butID.myReleased = false;
butID.myPressedCol = c_dkgray;
butID.myList = ds_list_create(); //
butID.myListType = type; //
butID.myListSep = (butID.myHeight/3); //
butID.myListDrawSep = true; //
butID.myPressX[0] = 0;
butID.myPressY[0] = 0;
butID.myPressX[1] = 0;
butID.myPressY[1] = 0;
butID.myScrollSpeed = 0;
butID.myScrollDir = 0;
butID.myListBigMove = false;
butID.myListOffset = 0;
butID.myListFriction = 0.2;
butID.myListSnap = 0; //no snap
butID.myListMaxOffset = 0;
butID.myType = GUI_TYPE_LIST; //one is box
butID.myAlpha_Back = 1;
butID.myAlpha_Border = 1;
butID.myAlpha_Text = 1;
butID.myCustomScript = "guiDrawList";
//butID.myCustomScript = "guiDrawHueLine";
ds_list_add(guiID.myDrawList,butID);

butID.ELID = guiGetIndex(guiID, butID);

return butID;
