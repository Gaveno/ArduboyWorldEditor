/// createTileImage(sprite, num_empty)

var spr = argument0;
var ne = argument1;
var surf = surface_create(132, 170);

surface_set_target(surf);
draw_clear_alpha(c_white, 1);

var i = 0;
for (var yy = 0; yy < 10; yy++) {
    for (var xx = 0; xx < 8; xx++) {
        if (i < sprite_get_number(spr)) {
            if (i < ne)
                draw_sprite_ext(spr, i, xx * 16, yy * 16, 1, 1, 0, c_green, 1);
            else
                draw_sprite_ext(spr, i, xx * 16, yy * 16, 1, 1, 0, c_red, 1);
        }
        i++;
    }
}

surface_reset_target();
var s = sprite_create_from_surface(surf, 0, 0, 132, 170, false, false, 0, 0);
surface_free(surf);

return s;
