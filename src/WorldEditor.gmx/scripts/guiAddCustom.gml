///////////////////////////////////////////////////////////////
//          guiAddCustom(guiID, object, x1,y1,x2,y2, type);
//
//          creates an instance of object and adds it
//          to the guiID setting it's variables
//          allowing it to act as a gui element
//          returns the instance id of the new instance
//
//          COPYRIGHT 2014 (C) Monkey Studios
///////////////////////////////////////////////////////////////
var guiID, obj, x1, y1, x2, y2, butID, type;
guiID = argument[0];
obj = argument[1];
x1 = argument[2];
y1 = argument[3];
x2 = argument[4];
y2 = argument[5];
type = argument[6];

butID = instance_create(x1,y1,obj);
butID.myWidth = max(x1,x2)-min(x1,x2);
butID.myHeight = max(y1,y2)-min(y1,y2);
butID.myColor = c_white;
butID.myText = " ";
butID.myTextCol = c_black;
butID.myGUI = guiID;
butID.myFont = fontNormal;
butID.myType = type; //zero is button
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
butID.myGUI = guiID;
butID.myCustomScript = " ";
ds_list_add(guiID.myDrawList,butID);

butID.ELID = guiGetIndex(guiID, butID);

return butID;
