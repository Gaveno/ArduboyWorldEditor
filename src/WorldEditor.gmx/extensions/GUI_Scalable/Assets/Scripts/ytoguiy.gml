//ytoguiy(y);
//returns y as gui y
var yy, dif;
yy = argument0;
dif = display_get_gui_height()/view_hview;
return ((yy-view_yview)*dif);
