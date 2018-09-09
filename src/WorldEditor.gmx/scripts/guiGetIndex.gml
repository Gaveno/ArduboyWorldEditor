////////////////////////////////////
//  guiGetIndex(guiID, guiObj);
//  returns the index of guiObj
//  in guiID
////////////////////////////////////

var guiID, guiObj;

guiID = argument0;
guiObj = argument1;

return ds_list_find_index(guiID.myDrawList,guiObj);
