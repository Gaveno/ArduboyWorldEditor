////////////////////////////////////
//      guiMoveTo(guiID, x, y);
//  moves a GUI to position x,y
//  along with all of it's elements
////////////////////////////////////

var guiID, xx, yy, difx, dify, i;

guiID = argument0;
xx = argument1;
yy = argument2;

difx = xx-guiID.x;
dify = yy-guiID.y;

guiID.x = xx;
guiID.y = yy;

for (i=0;i<ds_list_size(guiID.myDrawList);i++) {
    var obj;
    obj = ds_list_find_value(guiID.myDrawList,i);
    obj.x += difx;
    obj.y += dify;
}
