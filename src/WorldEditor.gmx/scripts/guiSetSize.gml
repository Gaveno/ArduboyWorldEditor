//////////////////////////////////
//      guiSetSize(gui, w, h)


var gui, w, h, sw, sh;

gui = argument0;
w = argument1;
h = argument2;

sw = w / gui.myWidth;
sh = h / gui.myHeight;

guiSetWidth(gui, sw);
guiSetHeight(gui, sh);

gui.scale *= min(sw, sh);
gui.scalex *= sw;
gui.scaley *= sh;

