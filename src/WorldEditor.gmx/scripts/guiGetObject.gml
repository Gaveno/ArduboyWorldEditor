///////////////////////////////
//  guiGetObject(guiID,index);
//  returns the instance id
//  of the guiID index
///////////////////////////////

var guiID, indx, obj;

guiID = argument0;
indx = argument1;

obj = ds_list_find_value(guiID.myDrawList,indx);
if (instance_exists(obj)) {
    return obj;
} else {
    return noone;
}
