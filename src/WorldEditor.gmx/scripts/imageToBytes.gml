/// imageToBytes(sprite, image, array);
// Converts a sprite into an array of bits in black and white (0, or 1)

var vhp = view_hview;
var vpp = view_hport;

view_hview = 1200;
view_hport = 1200;

var spr, array, a_w, a_h, maskarray;
spr = argument0;
array = argument2;
var image = argument1;
//maskarray = argument2;
a_w = sprite_get_width(spr);
a_h = ceil(sprite_get_height(spr) / 8) * 8;

var surf = surface_create(a_w, a_h);
if (surface_exists(surf)) {
    surface_set_target(surf);

    // Image
    draw_clear_alpha(c_black, 1);
    //for (var i = 0; i < sprite_get_number(spr); i++) {
        draw_sprite(spr, image, 0, 0);
    //}
    
    var xx = 0;
    var yy = 0;
    var ii = 0;
    var byte = 0;
    
    for (var i = 0; i < a_w * a_h; i++) {
        if (ii == 0) array[@ xx + (yy * a_w)] = 0;
        var color = draw_getpixel(xx, yy + ii);
        var r = color_get_red(color);
        var g = color_get_green(color);
        var b = color_get_blue(color);
        var avg = (r + b + g) / 3;
        var c;
        if (avg > 128) c = 1;
        else c = 0;
        array[@ xx + (yy * a_w)] |= c << ii;
        //if (ii == 7) show_debug_message(valueToByte(array[xx + (yy * a_w)]));
        
        ii++;
        if (ii > 7) {
            ii = 0;
            xx++;
            if (xx >= a_w) {
                xx = 0;
                yy += 8;
            }
        }
    }
    
    // Mask
    /*draw_clear_alpha(c_white, 1);
    draw_sprite_ext(spr, 0, 0, 0, 1, 1, 0, c_black, 1);
    
    xx = 0;
    yy = 0;
    ii = 0;
    byte = 0;
    
    for (var i = 0; i < a_w * a_h; i++) {
        if (ii == 0) maskarray[@ xx + (yy * a_w)] = 0;
        var color = draw_getpixel(xx, yy + ii);
        var r = color_get_red(color);
        var g = color_get_green(color);
        var b = color_get_blue(color);
        var avg = (r + b + g) / 3;
        var c;
        if (avg > 128) c = 1;
        else c = 0;
        maskarray[@ xx + (yy * a_w)] |= c << ii;
        //if (ii == 7) show_debug_message(valueToByte(array[xx + (yy * a_w)]));
        
        ii++;
        if (ii > 7) {
            maskarray[@ xx + (yy * a_w)] ^= 255;
            ii = 0;
            xx++;
            if (xx >= a_w) {
                xx = 0;
                yy += 8;
            }
        }
    }*/
    
    surface_reset_target();
    surface_free(surf);
}

view_hview = vhp;
view_hport = vpp;
