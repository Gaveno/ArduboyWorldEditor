/// guiAddSelection(selcontrol, selobject)
// add a selobject to a selcontrol object

var sc = argument0;
var so = argument1;

ds_list_add(sc.select_objects, so);
so.mySelectionParent = sc;
