/// clearWorld()

with objChunk {
    if (sprite_exists(sprite_index)) sprite_delete(sprite_index);
    instance_destroy();
}
with objSpecObject {
    instance_destroy();
}
with objRegion {
    instance_destroy();
}
with objSpecChunk {
    instance_destroy();
}
with objSpecTile {
    instance_destroy();
}
ds_list_clear(chunk);
ds_list_clear(region);
ds_list_clear(object);
ds_list_clear(specchunk);
ds_list_clear(specobject);
ds_list_clear(spectile);
player_x = 0;
player_y = 0;
world_internal_name = "newworld";
world_external_name = "newworld";
btn_world_name.myText = world_internal_name;
if (sprite_exists(custom_tiles)) sprite_delete(custom_tiles);
custom_num_tiles = sprite_get_number(sprTiles);
custom_tiles_path = "";
custom_num_empty = 14;
for (var i = 0; i < world_size; i++) {
    chunk_state[i] = 0;
}
