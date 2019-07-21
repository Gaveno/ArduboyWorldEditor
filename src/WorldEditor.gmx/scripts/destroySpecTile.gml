/// destroySpecTile(id)

var sc = argument0;

ds_list_delete(objControl.spectile, sc.index);
for (var i = 0; i < ds_list_size(objControl.spectile); i++) {
    if (objControl.spectile[| i] == sc) {
        ds_list_delete(objControl.spectile, i);
        i--;
    }
    objControl.spectile[| i].index = i;
}

with sc {
    instance_destroy();
}
