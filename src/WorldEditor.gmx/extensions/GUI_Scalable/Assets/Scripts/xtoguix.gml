//xtoguix(x);
//returns x as gui x
var xx, dif;
xx = argument0;
dif = display_get_gui_width()/view_wview;
return ((xx-view_xview)*dif);
