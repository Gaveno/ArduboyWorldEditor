/////////////////////////////////////////
//  drawPattern(x1,y1,x2,y2,sep,type);
//  types are:
//      PAT_CHECKER

var _x, _y, _sep, _pat, _w, _h;

_x[0] = round(argument0);
_y[0] = round(argument1);
_x[1] = round(argument2);
_y[1] = round(argument3);
_sep = argument4;
_pat = argument5;

_w = abs(_x[0]-_x[1]);
_h = abs(_y[0]-_y[1]);

if (_pat == PAT_CHECKER) {
var a,b;
for (a = 0; a < _w; a += _sep) {
    for (b = 0; b < _h; b += _sep) {
        draw_point(_x[0]+a,_y[0]+b);
    }
}
}

if (_pat == PAT_STRIPES) {
var a,b,c;
c = 0;
for (a = 0; a < _w-c; a += _sep) {
    for (b = 0; b < _h; b++) {
        draw_point(_x[0]+a+c,_y[0]+b);
        c++;
        if (c >= _sep) {
            c = 0;
        }
    }
    
}
}
