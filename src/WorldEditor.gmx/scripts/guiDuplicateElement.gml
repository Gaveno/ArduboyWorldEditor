///////////////////////////////////////////////////////////////////
// guiDuplicateElement(guiID, elID, x, y);
//
//      duplicates an existing element and returns the instance
//
//          COPYRIGHT 2014 (C) Monkey Studios
////////////////////////////////////////////////////////////////////
var guiID, x1, y1, elID, nelID;
guiID = argument[0];
elID = argument[1];
x1 = argument[2];
y1 = argument[3];
if (elID.type == GUI_TYPE_BUTTON)
    nelID = instance_create(x1, y1, objGUIButton);
else
    nelID = instance_create(x1, y1, objGUIBox);

nelID.myWidth = elID.myWidth;
nelID.myHeight = elID.myHeight;
nelID.myColor = elID.myColor;
nelID.myText = elID.myText;
nelID.myTextCol = elID.myTextCol;
nelID.myGUI = elID.myGUI;
nelID.myFont = elID.myFont;
nelID.myType = elID.myType; //zero is button
nelID.myStateChange = true;
nelID.myPressed = false;
nelID.myReleased = false;
nelID.myPressedCol = elID.myPressedCol;
nelID.myTextStretched = elID.myTextStretched;
nelID.myTextPos = elID.myTextPos;
//butID.mySprite = -1;
nelID.mySpritePos = elID.mySpritePos;
nelID.myOnlyText = elID.myOnlyText;
nelID.myCornerRadius = elID.myCornerRadius;
nelID.myAlpha_Back = elID.myAlpha_Back;
nelID.myAlpha_Border = elID.myAlpha_Border;
nelID.myAlpha_Text = elID.myAlpha_Text;
nelID.myCustomScript = elID.myCustomScript;
ds_list_add(guiID.myDrawList,nelID);
nelID.ELID = guiGetIndex(guiID, nelID);
return nelID;
