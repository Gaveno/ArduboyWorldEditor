/////////////////////////////////////////
//  guiSetScaleXY(gui, scalex, scaley);
//  change the scale of the gui
//  scale is relative to current
//  scale. For instance first call
//  of 2 would set the scale to 2
//  calling again to 2 would make
//  the scale 4 which is 2 * 2


var scale, wBefore, hBefore, gui;

gui = argument0;
scalex = argument1;
scaley = argument2;

wBefore = gui.myWidth;
hBefore = gui.myHeight;

gui.myWidth = round(gui.myWidth * scalex);
gui.myHeight = round(gui.myHeight * scaley);

gui.scale *= min(scalex, scaley);
gui.scalex = scalex;
gui.scaley = scaley;

for (i=0;i<ds_list_size(gui.myDrawList);i++)
{
        var obj;
        obj = gui.myDrawList[| i];
        
        obj.x = round(((obj.x - gui.x)  / wBefore) * gui.myWidth);
        obj.x += gui.x;
        obj.y = round(((obj.y - gui.y)  / hBefore) * gui.myHeight);
        obj.y += gui.y;
        
        obj.myWidth = round((obj.myWidth / wBefore) * gui.myWidth);
        obj.myHeight = round((obj.myHeight / hBefore) * gui.myHeight);
        
        obj.image_xscale = scalex;
        obj.image_yscale = scaley;
}

gui.myUpdate = true;

//surface_resize(gui.mySurf, gui.myWidth, gui.myHeight);
