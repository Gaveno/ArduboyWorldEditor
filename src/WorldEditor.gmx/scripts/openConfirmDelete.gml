/// openConfirmDelete(mode, obj)
// modes are:
//  0 - chunk
//  1 - region
//  2 - object
//
// obj is the object to delete

var mode = argument0;
var obj = argument1;

confirm_delete_gui = guiLoad("DeleteConfirm.gui", 120, 130);
confirm_delete_gui.mode = mode;
confirm_delete_gui.obj = obj;
btn_cd_delete = guiGetObject(confirm_delete_gui, 1);
btn_cd_cancel = guiGetObject(confirm_delete_gui, 3);
btn_cd_x = guiGetObject(confirm_delete_gui, 4);
