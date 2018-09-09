//////////////////////////////////////////////////////////////////
//  guiSetSprite(guiObj, sprite, sprite position);
//
//      sets a sprite to be drawn in the gui Element.
//      sprite position should be a value ranging from 0 and 2
//   GUI_SPRITE_CENTER, 0 = placed in the center of the element
//       GUI_SPRITE_AT, 1 = placed after the text
//       GUI_SPRITE_BT, 2 = placed before the text
//
///////////////////////////////////////////////////////////////////

var guiObj, spr, sprPos;

guiObj = argument0;
spr = argument1;
sprPos = argument2;

guiObj.sprite_index = spr;
guiObj.mySpritePos = sprPos;
