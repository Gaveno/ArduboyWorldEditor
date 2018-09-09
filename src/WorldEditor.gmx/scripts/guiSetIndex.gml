///////////////////////////////////////////////
//  guiSetIndex(guiID, guiObj, index);
//  changes the index of guiObj within
//  guiID
//  returns actual index.
//  value should be >= 0
///////////////////////////////////////////////

var guiID, guiObj, index;

guiID = argument0;
guiObj = argument1;
index = argument2;

if (index < 0 || index >= ds_list_size(guiID.myDrawList))
    exit;

guiObj.myStateChange = true;

ds_list_delete(guiID.myDrawList,guiGetIndex(guiID,guiObj));
ds_list_insert(guiID.myDrawList,index,guiObj);
return guiGetIndex(guiID,guiObj);
