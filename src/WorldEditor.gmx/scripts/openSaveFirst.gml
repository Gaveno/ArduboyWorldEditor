/// openSaveFirst([load])

if (ds_list_size(chunk) > 0 || ds_list_size(region) > 0) {
    save_first_gui = guiLoad("SaveFirst.gui", 80, 80);
    btn_sf_yes = guiGetObject(save_first_gui, 1);
    btn_sf_no = guiGetObject(save_first_gui, 2);
    btn_sf_x = guiGetObject(save_first_gui, 3);
    if (argument_count > 0) {
        save_first_gui.loading = argument[0];
    }
    else {
        save_first_gui.loading = false;
    }
}
