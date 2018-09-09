/// guiGetSelectionIndex(selcontrol)
// get the object selected inside a selection control object

var sel = argument0;
for (var i = 0; i < ds_list_size(sel.select_objects); i++) {
    if (sel.select_objects[| i].mySelection)
        return i;
}
