/// openSaveMenu(new after)

save_gui = guiLoad("Save.gui", 50, 50);
if (argument_count > 0)
    save_gui.newafter = argument[0];
else
    save_gui.newafter = false;
btn_save_name = guiGetObject(save_gui, 2);
btn_save_name.myInputBox = true;
btn_save_name.myInputType = INPUT_TYPE_STRING;
btn_save_name.myAllowSpace = false;
btn_save_name.myText = world_external_name;
btn_save_save = guiGetObject(save_gui, 3);
btn_save_cancel = guiGetObject(save_gui, 4);
btn_save_x = guiGetObject(save_gui, 5);
