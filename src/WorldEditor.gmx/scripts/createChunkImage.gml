/// createChunkImage(Chunk)
// sets the sprite image of the Chunk object to
// a generated one based off the Chunks tiles.

var spr;
if (sprite_exists(custom_tiles)) spr = custom_tiles;
else spr = sprTiles;
var _c = argument0;
var surf = surface_create(sprite_get_width(spr) * 6, sprite_get_height(spr) * 6);

if (sprite_exists(_c.sprite_index)) {
    sprite_delete(_c.sprite_index);
}

surface_set_target(surf);

var xx = 0;
var yy = 0;

for (var i = 0; i < 36; i++) {
    draw_sprite(spr, _c.tile[i], xx, yy);
    xx += sprite_get_width(spr);
    if (xx >= sprite_get_width(spr) * 6) {
        xx = 0;
        yy += sprite_get_height(spr);
    }
}

surface_reset_target();
_c.sprite_index = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), surface_get_height(surf), false, false, 0, 0);
surface_free(surf);
