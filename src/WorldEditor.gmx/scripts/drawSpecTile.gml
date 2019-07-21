/// drawSpecTile()

if (sprite_exists(objControl.custom_tiles)) {
    draw_sprite(objControl.custom_tiles, tile, x, y);
}
else {
    draw_sprite(sprTiles, tile, x, y);
}


if (objControl.btn_show_chunks.myChecked) {
    draw_set_alpha(0.3);
    draw_set_color(c_red);
    draw_rectangle(x, y, x + 16, y + 16, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
