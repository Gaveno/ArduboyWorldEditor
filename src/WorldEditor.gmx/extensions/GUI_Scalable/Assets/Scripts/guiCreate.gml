//////////////////////////////////////
// guiCreate(x,y,width, height);
//
// creates an empty gui layer
// and returns the new guis id
//
// COPYRIGHT 2014 (C) Monkey Studios
//////////////////////////////////////
var guiID, width, height,xx, yy;
xx = argument0;
yy = argument1;
width = argument2;
height = argument3;
guiID = instance_create(xx,yy,objGUIBase);
guiID.myWidth = width;
guiID.myHeight = height;
guiID.Visible = true;
guiID.mySurf = surface_create(width,height);
guiID.myUpdate = true;
surface_set_target(guiID.mySurf);
draw_clear_alpha(c_white,0);
surface_reset_target();
guiID.myDrawList = ds_list_create();
guiID.scale = 1;
guiID.scalex = 1;
guiID.scaley = 1;

return guiID;
