/// openObjectSelect(show Use button)

var use = argument0;

object_sel_gui = guiLoad("ObjectSelect.gui", 140, 100);
btn_os_use = guiGetObject(object_sel_gui, 9);
btn_os_use.tooltip = "Place selected object into the region.";
btn_os_next = guiGetObject(object_sel_gui, 6);
btn_os_prev = guiGetObject(object_sel_gui, 7);
btn_os_cancel = guiGetObject(object_sel_gui, 8);
if (!use)
    btn_os_cancel.myText = "CLOSE";
btn_os_new = guiGetObject(object_sel_gui, 10);
btn_os_new.tooltip = "Create a new blank object."
btn_os_edit = guiGetObject(object_sel_gui, 11);
btn_os_edit.tooltip = "Edit the selected object.";
btn_os_del = guiGetObject(object_sel_gui, 12);
btn_os_iid = guiGetObject(object_sel_gui, 13);
btn_os_iid.myInputBox = true;
btn_os_iid.myInputType = INPUT_TYPE_INT;
btn_os_iid.myInputMax = 63;
btn_os_name = guiGetObject(object_sel_gui, 14);
btn_os_name.myInputBox = true;
btn_os_name.myInputType = INPUT_TYPE_STRING;
if (!use) {
    btn_os_use.visible = false;
    btn_os_iid.visible = false;
    btn_os_name.visible = false;
    var box_os_iid = guiGetObject(object_sel_gui, 3);
    box_os_iid.visible = false;
    var box_os_iname = guiGetObject(object_sel_gui, 15);
    box_os_iname.visible = false;
}
else {
    btn_os_iid.myText = string(specific_object.IID);
    btn_os_name.myText = specific_object.name;
}
btn_os_del.tooltip = "Permanently delete the selected object.#This cannot be undone!";
btn_os_object[0] = guiGetObject(object_sel_gui, 5);
btn_os_object[0].visible = true;
var spacing = 7;
scroll = 0;
for (var i = 1; i < ds_list_size(object); i++) {
    btn_os_object[i] = guiDuplicateElement(object_sel_gui, btn_os_object[i - 1],
                                        btn_os_object[0].x,
                                        btn_os_object[i - 1].y + btn_os_object[0].myHeight + spacing);
}
if (ds_list_size(object) == 0) {
    btn_os_object[0].visible = false;
}
for (var i = 0; i < ds_list_size(object); i++) {
    btn_os_object[i].myObject = object[| i];
    btn_os_object[i].sprite_index = sprObjects;
    btn_os_object[i].image_index = object[| i].image_index;
    btn_os_object[i].image_xscale = 2;
    btn_os_object[i].image_yscale = 2;
    btn_os_object[i].myText = object[| i].name;
    btn_os_object[i].starty = btn_os_object[i].y;
    if (object_selected == i)
        btn_os_object[i].myColor = c_green;
}
