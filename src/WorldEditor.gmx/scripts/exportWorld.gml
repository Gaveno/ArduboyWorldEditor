/// exportWorld(name, save image, save copy)

var name = argument0;
var savei = argument1;
var savec = argument2;

export_wait_gui = guiLoad("ExportWait.gui", 200, 200);
guiMoveTo(export_wait_gui, display_get_gui_width() / 2 - export_wait_gui.myWidth / 2,
    display_get_gui_height() / 2 - export_wait_gui.myHeight);
    
__name = name;
__savei = savei;
__savec = savec;

alarm[1] = 1;
