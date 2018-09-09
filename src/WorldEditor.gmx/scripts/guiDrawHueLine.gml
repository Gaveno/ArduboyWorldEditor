///////////////////////////////////////////////
//  guiDrawHueLine(guiObj, surface);
//
//  uses the guiObj's info to
//  draw a hue line based on
//  greater height or width
///////////////////////////////////////////////

var guiObj, mode, surf, col, h, s, v, i, prevSurf, wid, hei,
xx, yy;

guiObj = argument[0];
h = 0;
s = 255;
v = 255;
xx = guiObj.x-x;
yy = guiObj.y-y;

if (guiObj.myWidth > guiObj.myHeight) {
    mode = 0; //horizontal
    surf = surface_create(255,1);
    wid = 255;
    hei = 1;
} else {
    mode = 1; //vertical
    surf = surface_create(1,255);
    wid = 1;
    hei = 255;
}
surface_reset_target();
surface_set_target(surf);
col = make_color_hsv(h,s,v);

for (i = 0; i <= 255; i++) {
    h = i;
    col = make_color_hsv(h,s,v);
    draw_set_color(col);
    if (mode) {
        draw_point(0,i);
    } else {
        draw_point(i,0);
    }
}
surface_reset_target();
surface_set_target(mySurf);

draw_surface_ext(surf,xx,yy,guiObj.myWidth/wid,guiObj.myHeight/hei,0,c_white,1);
surface_free(surf);
draw_set_color(c_black);
draw_rectangle(xx,yy-2,xx+guiObj.myWidth+2,yy+guiObj.myHeight+2,true);
draw_set_color(c_white);
draw_rectangle(xx-1,yy-1,xx+guiObj.myWidth+1,yy+guiObj.myHeight+1,true);
