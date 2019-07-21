/// drawMiniMap()

var startx = box_mini_map.x + 2;
var starty = box_mini_map.y + 2;
var size = 3;
var tsize = 96;
var surf = surface_create(tsize + 1, tsize + 1);

surface_set_target(surf);
draw_clear_alpha(c_white, 1);

// draw regions
// arrange regions by depth
if (ds_list_size(region) > 0) {
    var ordered_regions = ds_list_create();
    ds_list_add(ordered_regions, region[| 0]);
    for (var i = 1; i < ds_list_size(region); i++) {
        var placed = false;
        for (var a = 0; a < ds_list_size(ordered_regions); a++) {
            if (!placed) {
                if (region[| i].depth < ordered_regions[| a].depth) {
                    placed = true;
                    ds_list_insert(ordered_regions, a, region[| i]);
                }
            } 
        }
        if (!placed) {
            ds_list_add(ordered_regions, region[| i]);
        }
    }
    
    if (btn_show_regions.myChecked) {
        for (var i = ds_list_size(ordered_regions) - 1; i >= 0; i--) {
            draw_set_color(ordered_regions[| i].myColor);
            draw_rectangle(ordered_regions[| i].x * 96 / room_width * tsize, ordered_regions[| i].y * 96 / room_height * tsize,
                          (ordered_regions[| i].x * 96 + ordered_regions[| i].width * 96) / room_width * tsize,
                          (ordered_regions[| i].y * 96 + ordered_regions[| i].height * 96) / room_height * tsize, false);
        }
    }
    
    ds_list_destroy(ordered_regions);
}

var xx = 0;
var yy = 0;
for(var i = 0; i < world_size; i++) {
    // draw solid
    if (chunk_state[i] && btn_show_solid.myChecked) {
        draw_set_color(c_red);
        draw_rectangle(xx, yy, xx + size - 1, yy + size - 1, false);
    }
    draw_set_color(c_black);
    draw_rectangle(xx, yy, xx + size, yy + size, true);
    xx += size;
    if (xx >= tsize) {
        xx = 0;
        yy += size;
    } 
}

// draw specific chunks
if (btn_show_chunks.myChecked) {
    draw_set_color(c_blue);
    for (var i = 0; i < ds_list_size(specchunk); i++) {
        draw_rectangle(specchunk[| i].x / room_width * tsize + 1, specchunk[| i].y / room_height * tsize + 1,
            (specchunk[| i].x + 96) / room_width * tsize - 1,
            (specchunk[| i].y + 96) / room_height * tsize - 1, false);
    }
}

// draw border
draw_rectangle(0, 0, tsize, tsize, true);

draw_set_color(c_green);
draw_rectangle(view_xview / room_width * tsize, view_yview / room_height * tsize, 
                (view_xview + view_wview) / room_width * tsize, (view_yview + view_hview) / room_height * tsize, true);
                
surface_reset_target();

draw_surface(surf, startx, starty);

surface_free(surf);
