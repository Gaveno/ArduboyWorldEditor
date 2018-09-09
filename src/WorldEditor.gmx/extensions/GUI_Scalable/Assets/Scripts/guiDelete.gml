///////////////////////////////
//  guiDelete(guiID, pos);
//
//  deletes the gui
//  element at pos
//
////////////////////////////////
var guiID, pos, inst;
guiID = argument0;
pos = argument1;
inst = ds_list_find_value(guiID.myDrawList,pos);
if (instance_exists(inst)) {
    with inst {
        instance_destroy();
    }
}
ds_list_delete(guiID.myDrawList,pos);
