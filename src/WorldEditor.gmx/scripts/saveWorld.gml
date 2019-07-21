/// saveWorld(name)

world_external_name = argument0;
var savedir = "saves\" + world_external_name;

var error = false;
for (var i = 0; i < ds_list_size(region); i++) {
    if (region.type == 0) {
        if (!(instance_exists(region[| i].chunks[0]) && instance_exists(region[| i].chunks[1])))
        {
            error = true;
        }
    }
    else {
        for (var a = 0; a < MAX_CHUNKS_IN_REGION; a++) {
            if (!instance_exists(region[| i].chunks[a])) {
                error = true;
            }
        }
    }
}

if (error) {
    show_message("Error: Cannot save world!#Must define all chunks for every region!");
    exit;
}

if (string_length(world_external_name) > 0) {
    // custom tileset
    if (string_length(custom_tiles_path) > 0 && file_exists(custom_tiles_path)) {
        if (file_exists(savedir + "_tiles.png"))
            file_delete(savedir + "_tiles.png");
        file_copy(custom_tiles_path, savedir + "_tiles.png");
        custom_tiles_path = "";
    }
    
    if (file_exists(savedir + ".awd")) {
        file_copy(savedir + ".awd", "backups\" + world_external_name + "_" + string(current_month) + string(current_day) + string(current_hour)
                         + string(current_minute) + string(current_second) + ".awd");
    }
    // general data
    var file = file_text_open_write(savedir + ".awd");
    //var file = file_text_open_write(savedir + "\gen.dat");
    world_internal_name = btn_world_name.myText;
    file_text_write_string(file, world_internal_name);
    file_text_writeln(file);
    for (var i = 0; i < world_size; i++) {
        file_text_write_string(file, string(chunk_state[i]));
        file_text_writeln(file);
    }
    //file_text_close(file);
    
    // chunks
    //file = file_text_open_write(savedir + "\chunks.dat");
    file_text_write_string(file, "___chunks___");
    file_text_writeln(file);
    file_text_write_string(file, string(ds_list_size(chunk)));
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(chunk); i++) {
        file_text_write_string(file, chunk[| i].name);
        file_text_writeln(file);
        for (var a = 0; a < 36; a++) {
            file_text_write_string(file, string(chunk[| i].tile[a]));
            file_text_writeln(file);
        }
    }
    //file_text_close(file);
    
    // objects
    //file = file_text_open_write(savedir + "\objects.dat");
    file_text_write_string(file, "___objects___");
    file_text_writeln(file);
    file_text_write_string(file, string(ds_list_size(object)));
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(object); i++) {
        file_text_write_string(file, object[| i].name);
        file_text_writeln(file);
        file_text_write_string(file, string(object[| i].image_index));
        file_text_writeln(file);
    }
    //file_text_close(file);
    
    // specific objects
    //file = file_text_open_write(savedir + "\specobjects.dat");
    file_text_write_string(file, "___specobjects___");
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(specobject); i++) {
        if (!instance_exists(specobject[| i])) {
            ds_list_delete(specobject, i);
            i--;
        }
        if (!instance_exists(specobject[| i].myObject)) {
            with specobject[| i] {
                instance_destroy();
            }
            ds_list_delete(specobject, i);
            i--;
        }
    }
    file_text_write_string(file, string(ds_list_size(specobject)));
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(specobject); i++) {
        if (instance_exists(specobject[| i].myObject)) {
            file_text_write_string(file, string(specobject[| i].myObject.index));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].x));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].y));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].destx));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].desty));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].image_index));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].IID));
            file_text_writeln(file);
            file_text_write_string(file, string(specobject[| i].name));
            file_text_writeln(file);
        }
    }
    //file_text_close(file);
    
    // specific chunks
    //file = file_text_open_write(savedir + "\specchunks.dat");
    file_text_write_string(file, "___specchunks___");
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(specchunk); i++) {
        if (!instance_exists(specchunk[| i].myChunk) || specchunk[| i].sprite_index == sprBlankChunk) {
            with specchunk[| i] {
                instance_destroy();
            }
            ds_list_delete(specchunk, i);
            i--;
        }
        specchunk[| i].index = i;
    }
    file_text_write_string(file, string(ds_list_size(specchunk)));
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(specchunk); i++) {
        if (instance_exists(specchunk[| i].myChunk)) {
            file_text_write_string(file, string(specchunk[| i].myChunk.index));
            file_text_writeln(file);
            file_text_write_string(file, string(specchunk[| i].x));
            file_text_writeln(file);
            file_text_write_string(file, string(specchunk[| i].y));
            file_text_writeln(file);
        }
    }
    //file_text_close(file);
    
    // regions
    //file = file_text_open_write(savedir + "\regions.dat");
    file_text_write_string(file, "___regions___");
    file_text_writeln(file);
    file_text_write_string(file, string(ds_list_size(region)));
    file_text_writeln(file);
    for (var i = 0; i < ds_list_size(region); i++) {
        file_text_write_string(file, region[| i].name);
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].x));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].y));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].width));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].height));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].type));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].depth));
        file_text_writeln(file);
        file_text_write_string(file, string(region[| i].myColor));
        file_text_writeln(file);
        
        for (var a = 0; a < 17; a++) {
            if (instance_exists(region[| i].chunks[a])) {
                file_text_write_string(file, string(region[| i].chunks[a].index));
                file_text_writeln(file);
            } else {
                file_text_write_string(file, "-1");
                file_text_writeln(file);
            }
        }
    }
    
    // player start location
    file_text_write_string(file, "___player___");
    file_text_writeln(file);
    file_text_write_string(file, string(player_x));
    file_text_writeln(file);
    file_text_write_string(file, string(player_y));
    file_text_writeln(file);
    
    // custom tileset
    file_text_write_string(file, "___tiles___");
    file_text_writeln(file);
    file_text_write_string(file, string(custom_num_empty));
    file_text_writeln(file);
    file_text_write_string(file, string(custom_num_tiles));
    file_text_writeln(file);
    
    // specific tiles
    if (ds_list_size(spectile) > 0) {
        file_text_write_string(file, "___spectiles___");
        file_text_writeln(file);
        for (var i = 0; i < ds_list_size(spectile); i++) {
            file_text_write_string(file, string(spectile[| i].tile));
            file_text_writeln(file);
            file_text_write_string(file, string(spectile[| i].x));
            file_text_writeln(file);
            file_text_write_string(file, string(spectile[| i].y));
            file_text_writeln(file);
        }
    }
    
    file_text_close(file);
    
    if (saveextra) {
        var savename = get_save_filename_ext("Arduventure Save File|*.awd", world_internal_name + ".awd", program_directory, "Save copy as...");
        if (is_string(savename) && string_length(savename) > 0) {
            file_copy(savedir + ".awd", savename);
        }
    }
    
    if (save_gui.newafter == 1) clearWorld();
    if (save_gui.newafter == 2) loadSelectedWorld();
}
