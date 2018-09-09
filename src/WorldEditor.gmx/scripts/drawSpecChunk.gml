/// drawSpecChunk()
// draw code for specific chunks

cused = false;
if (sprite_exists(sprite_index)) {
    draw_self();
    cused = true;
}
else
{
    if (instance_exists(myChunk) && sprite_exists(myChunk.sprite_index)) {
        myChunk.is_used = true;
        sprite_index = myChunk.sprite_index;
    } else
        sprite_index = sprBlankChunk;
}


if (objControl.btn_show_chunks.myChecked) {
    draw_set_alpha(0.3);
    draw_set_color(c_blue);
    draw_rectangle(x, y, x + 96, y + 96, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
