/// destroySpecChunk(id)

var sc = argument0;

ds_list_delete(objControl.specchunk, sc.index);
for (var i = 0; i < ds_list_size(objControl.specchunk); i++) {
    if (objControl.specchunk[| i] == sc) {
        ds_list_delete(objControl.specchunk, i);
        i--;
    }
    objControl.specchunk[| i].index = i;
}

with sc {
    instance_destroy();
}
