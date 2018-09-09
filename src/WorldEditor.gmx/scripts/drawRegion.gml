/// drawRegion()
// draw code for regions

for (var i = 0; i < MAX_CHUNKS_IN_REGION; i++) {
    cused[i] = false;
}

switch (type) {
    // binary
    case 0: {
        for(var xx = x; xx < x+width; xx++) {
            for (var yy = y; yy < y+height; yy++) {
                //if (rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview)) {
                    if (!getSolidState(xx, yy)) {
                        if (instance_exists(chunks[0])) {
                            cused[0] = true;
                            var sprite = chunks[0].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                    else {
                        if (instance_exists(chunks[1])) {
                            cused[1] = true;
                            var sprite = chunks[1].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                //}
            }
        }
    } break;
    
    // empty center
    case 1: {
        for(var xx = x; xx < x+width; xx++) {
            for (var yy = y; yy < y+height; yy++) {
                //if (rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview)) {
                    if (getSolidState(xx, yy)) {
                        if (instance_exists(chunks[16])) {
                            cused[16] = true;
                            var sprite = chunks[16].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                    else {
                        var s = 0;
                        var r = getSolidState(xx + 1, yy);
                        var t = getSolidState(xx, yy - 1);
                        var l = getSolidState(xx - 1, yy);
                        var b = getSolidState(xx, yy + 1);
                        s = r | (t << 1) | (l << 2) | (b << 3);
                        
                        if (instance_exists(chunks[s])) {
                            cused[s] = true;
                            var sprite = chunks[s].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                //}
            }
        }
    } break;
    
    // solid center
    case 2: {
        for(var xx = x; xx < x+width; xx++) {
            for (var yy = y; yy < y+height; yy++) {
                //if (rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview)) {
                    if (!getSolidState(xx, yy)) {
                        if (instance_exists(chunks[16])) {
                            cused[16] = true;
                            var sprite = chunks[16].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                    else {
                        var s = 0;
                        var r = getSolidState(xx + 1, yy);
                        var t = getSolidState(xx, yy - 1);
                        var l = getSolidState(xx - 1, yy);
                        var b = getSolidState(xx, yy + 1);
                        s = r | (t << 1) | (l << 2) | (b << 3);
                        
                        if (instance_exists(chunks[s])) {
                            cused[s] = true;
                            var sprite = chunks[s].sprite_index;
                            if (sprite_exists(sprite) && rectangle_in_rectangle(xx * 96, yy * 96, xx * 96 +96, yy * 96 +96, view_xview, view_yview, view_xview+view_wview, view_yview+view_hview))
                                draw_sprite(sprite, 0, xx * 96, yy * 96);
                        }
                    }
                //}
            }
        }
    } break;
}

if (objControl.btn_show_regions.myChecked) {
    draw_set_color(myColor);
    draw_set_alpha(0.2);
    draw_rectangle(x * 96, y * 96, 96 * (x + width), 96 * (y + height), false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
