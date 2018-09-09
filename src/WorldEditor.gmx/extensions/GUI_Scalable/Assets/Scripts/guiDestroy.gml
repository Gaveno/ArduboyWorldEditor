//////////////////////////////////////
// guiDestroy(guiID);
//
// destroys the gui layer guiID and
// all of it's variables freeing
// memory
//
// COPYRIGHT 2014 (C) Monkey Studios
//////////////////////////////////////
var guiID;
guiID = argument0;
if (instance_exists(guiID))
with guiID {
    if (ds_exists(myDrawList,ds_type_list)) {
        for (i=0;i<ds_list_size(myDrawList);i++) {
            var obj;
            obj = ds_list_find_value(myDrawList,i);
            if (instance_exists(obj)) {
                with obj {
                    instance_destroy();
                }
            }
        }
        ds_list_destroy(myDrawList);
    }
    if (surface_exists(mySurf)) {
        surface_free(mySurf);
    }
    instance_destroy();
}
