/// guiCreateSelection(guiID, objects to add)
// creates selection object and returns the index.
// optionally add objects to include in selection

var sel = instance_create(0, 0, objGUISelection);
var mygui = argument[0];

for (var i = 1; i < argument_count; i++) {
    ds_list_add(sel.select_objects, argument[i]);
    argument[i].mySelectionParent = sel;
}
sel.myGUI = mygui;

return sel;
