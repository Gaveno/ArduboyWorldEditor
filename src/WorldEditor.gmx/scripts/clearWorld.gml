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
ds_list_clear(chunk);
ds_list_clear(region);
ds_list_clear(object);
ds_list_clear(specchunk);
ds_list_clear(specobject);
world_internal_name = "newworld";
world_external_name = "newworld";
btn_world_name.myText = world_internal_name;
for (var i = 0; i < world_size; i++) {
    chunk_state[i] = 0;
}
