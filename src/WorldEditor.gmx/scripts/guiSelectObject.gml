/// guiSelectObject(obj)
// select a selection object obj
// must be in a selection

var obj = argument0;

if (instance_exists(obj.mySelectionParent)) {
    for (var i = 0; i < ds_list_size(obj.mySelectionParent.select_objects); i++) {
        if (obj.mySelectionParent.select_objects[| i] != obj)
            obj.mySelectionParent.select_objects[| i].mySelection = false;
    }
    obj.mySelection = true;
}
