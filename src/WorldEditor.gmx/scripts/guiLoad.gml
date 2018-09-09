///////////////////////////////////////
//  guiLoad(fname, x, y);
//  loads the guiID to fname
//
///////////////////////////////////////

var guiID, fname, file, read, i, listsize;

xx = argument1;
yy = argument2;
//guiID = instance_create(xx,yy,objGUIBase);
//guiID.myWidth = width;
//guiID.myHeight = height;
//guiID.Visible = true;
//guiID.myUpdate = true;
//guiID.mySurf = surface_create(width,height);
//surface_set_target(guiID.mySurf);
//draw_clear_alpha(c_white,0);
//surface_reset_target();
//guiID.myDrawList = ds_list_create();

fname = argument0;

var version;

version = "";

file = file_bin_open(fname, 0);

read = file_bin_read_byte(file);
if (read != ord("G"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("U"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("I"))
    return -1;
read = file_bin_read_byte(file);

read = file_bin_read_byte(file);
version = chr(read); //0
read = file_bin_read_byte(file);
version = version+chr(read); //1
read = file_bin_read_byte(file);
version = version+chr(read); //.
read = file_bin_read_byte(file);
version = version+chr(read); //0
read = file_bin_read_byte(file);
version = version+chr(read); //0
file_bin_close(file);

//show_message("File version "+version);
var error;
error = -1;
if (version == "01.01") {
    //show_message("Loading "+fname+" using version 01.01");
    error = guiLoad01_01(fname,xx,yy);
}
if (version == "01.00") {
    //show_message("Loading "+fname+" using version 01.00");
    error = guiLoad01_00(fname,xx,yy);
}
if (error == -1) {
    //show_message("Loading "+fname+" using pre 1.0");
    error = guiLoadOld(fname,xx,yy);
}
if (error == -1) {
    show_message("Failed to load "+fname);
    return -1;
}
if (instance_exists(error)) {
    if (instance_exists(gui_focus)) {
        error.depth = gui_focus.depth - 1;
        gui_focus.focusPrevious = gui_focus;
        gui_focus.myFocus = false;
    }
    error.myFocus = true;
    gui_focus = error;
}
return error;
