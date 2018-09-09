///////////////////////////////
//  guiDeleteObj(guiObj);
//
//  deletes the gui
//  element at pos
//
////////////////////////////////
var guiID, guiObj, pos;
guiObj = argument0;
guiID = guiObj.myGUI;
pos = ds_list_find_index(guiID.myDrawList,guiObj);
ds_list_delete(guiID.myDrawList,pos);
guiID.myUpdate = true;
    with guiObj {
        if (guiObj.myType == GUI_TYPE_LIST)
            ds_list_destroy(guiObj.myList);

        instance_destroy();
    }
