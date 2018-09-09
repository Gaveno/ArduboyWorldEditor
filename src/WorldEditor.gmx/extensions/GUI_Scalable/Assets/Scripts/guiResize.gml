/////////////////////////////
//  guiResize(guiID,w,h);
// changes the width and
// height of an existing
// guiID to new w, h
/////////////////////////////

var guiID, w, h;

guiID = argument0;
w = argument1;
h = argument2;

guiID.myWidth = w;
guiID.myHeight = h;
with guiID {
    surface_free(mySurf);
}
