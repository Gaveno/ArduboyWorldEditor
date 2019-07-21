/// loadSelectedWorld

var w = "saves\" + btn_load_world[world_selected].myText;
//if (file_exists(w + "\gen.dat")) {
if (file_exists(w + ".awd")) {
    clearWorld();
    
    // general
    //var file = file_text_open_read(w + "\gen.dat");
    var file = file_text_open_read(w + ".awd");
    world_external_name = btn_load_world[world_selected].myText;
    world_internal_name = file_text_read_string(file);
    btn_world_name.myText = world_internal_name;
    btn_world_name.myStateChange = true;
    file_text_readln(file);
    for (var i = 0; i < world_size; i++) {
        chunk_state[i] = real(file_text_read_string(file));
        file_text_readln(file);
    }
    //file_text_close(file);
    
    // chunks
    var line = file_text_read_string(file);
    file_text_readln(file);
    if (line == "___chunks___") {
    //if (file_exists(w + "\chunks.dat")) {
        //file = file_text_open_read(w + "\chunks.dat");
        var num_chunks = real(file_text_read_string(file));
        file_text_readln(file);
        for (var i = 0; i < num_chunks; i++) {
            if (!file_text_eof(file)) {
                var c = instance_create(0, 0, objChunk);
                ds_list_add(chunk, c);
                c.name = file_text_read_string(file);
                c.index = ds_list_size(chunk) - 1;
                file_text_readln(file);
                
                // tiles
                for (var a = 0; a < 36; a++) {
                    c.tile[a] = real(file_text_read_string(file));
                    file_text_readln(file);
                }
                createChunkImage(c);
            }
            else {
                show_message("Currupt chunk file!");
                exit;
            }
        }
        //file_text_close(file);
    }
    else {
        show_message("Currupt world file!#Error: could not read chunk data!");
        exit;
    }
    
    // objects
    line = file_text_read_string(file);
    file_text_readln(file);
    if (line == "___objects___") {
    //if (file_exists(w + "\objects.dat")) {
        //file = file_text_open_read(w + "\objects.dat");
        var num_objects = real(file_text_read_string(file));
        file_text_readln(file);
        for (var i = 0; i < num_objects; i++) {
            if (!file_text_eof(file)) {
                var c = instance_create(0, 0, objObject);
                ds_list_add(object, c);
                c.name = file_text_read_string(file);
                c.index = ds_list_size(object) - 1;
                file_text_readln(file);
                c.image_index = real(file_text_read_string(file));
                file_text_readln(file);
            }
            else {
                show_message("Currupt object file!");
                exit;
            }
        }
        //file_text_close(file);
    }
    else {
        show_message("Currupt world file!#Error: could not read object data!");
        exit;
    }
    
    
    // specific objects
    line = file_text_read_string(file);
    file_text_readln(file);
    if (line == "___specobjects___") {
    //if (file_exists(w + "\specobjects.dat")) {
        //file = file_text_open_read(w + "\specobjects.dat");
        var num_objects = real(file_text_read_string(file));
        file_text_readln(file);
        for (var i = 0; i < num_objects; i++) {
            if (!file_text_eof(file)) {
                var c = instance_create(0, 0, objSpecObject);
                ds_list_add(specobject, c);
                c.myObject = object[| real(file_text_read_string(file))];
                c.index = ds_list_size(chunk) - 1;
                file_text_readln(file);
                c.x = real(file_text_read_string(file));
                file_text_readln(file);
                c.y = real(file_text_read_string(file));
                file_text_readln(file);
                c.destx = real(file_text_read_string(file));
                file_text_readln(file);
                c.desty = real(file_text_read_string(file));
                file_text_readln(file);
                c.image_index = real(file_text_read_string(file));
                file_text_readln(file);
                c.IID = real(file_text_read_string(file));
                file_text_readln(file);
                c.name = file_text_read_string(file);
                if (file_text_eof(file)) {
                    show_message("Currupt specific object file!");
                    with c { instance_destroy(); }
                    ds_list_delete(specobject, ds_list_size(specobject) - 1);
                }
                file_text_readln(file);
            }
            else {
                show_message("Currupt specific object file!");
                exit;
            }
        }
        //file_text_close(file);
    }
    else {
        show_message("Currupt world file!#Error: could not read specific object data!");
        exit;
    }
    
    // specific chunks
    line = file_text_read_string(file);
    file_text_readln(file);
    if (line == "___specchunks___") {
    //if (file_exists(w + "\specchunks.dat")) {
        //file = file_text_open_read(w + "\specchunks.dat");
        var num_specchunks = real(file_text_read_string(file));
        file_text_readln(file);
        for (var i = 0; i < num_specchunks; i++) {
            if (!file_text_eof(file)) {
                var c = instance_create(0, 0, objSpecChunk);
                c.myChunk = chunk[| real(file_text_read_string(file))];
                ds_list_add(specchunk, c);
                c.sprite_index = c.myChunk.sprite_index;
                file_text_readln(file);
                c.x = real(file_text_read_string(file));
                file_text_readln(file);
                c.y = real(file_text_read_string(file));
                file_text_readln(file);
                c.index = ds_list_size(specchunk) - 1;
            }
            else {
                show_message("Currupt specific chunk file!");
                exit;
            }
        }
        //file_text_close(file);
    }
    else {
        show_message("Currupt world file!#Error: could not read specific chunk data!");
        exit;
    }
    
    // regions
    line = file_text_read_string(file);
    file_text_readln(file);
    if (line == "___regions___") {
    //if (file_exists(w + "\regions.dat")) {
        //file = file_text_open_read(w + "\regions.dat");
        var num_regions = real(file_text_read_string(file));
        file_text_readln(file);
        for (var i = 0; i < num_regions; i++) {
            if (!file_text_eof(file)) {
                var r = instance_create(0, 0, objRegion);
                ds_list_add(region, r);
                r.name = file_text_read_string(file);
                file_text_readln(file);
                r.x = real(file_text_read_string(file));
                file_text_readln(file);
                r.y = real(file_text_read_string(file));
                file_text_readln(file);
                r.width = real(file_text_read_string(file));
                file_text_readln(file);
                r.height = real(file_text_read_string(file));
                file_text_readln(file);
                r.type = real(file_text_read_string(file));
                file_text_readln(file);
                r.depth = real(file_text_read_string(file));
                file_text_readln(file);
                r.myColor = real(file_text_read_string(file));
                file_text_readln(file);
                
                // chunks
                for (var a = 0; a < 17; a++) {
                    var v = real(file_text_read_string(file));
                    if (v != -1) {
                        r.chunks[a] = chunk[| v];
                    }
                    file_text_readln(file);
                }
            }
            else {
                show_message("Currupt region file!");
                exit;
            }
        }
        
        //file_text_close(file);
        
    }
    else {
        show_message("Currupt world file!#Error: could not read region data!");
        exit;
    }
    
    var line = file_text_read_string(file);
    //show_debug_message(line);
    while (!file_text_eof(file)) {
        if (line == "___player___") {
            file_text_readln(file);
            player_x = real(file_text_read_string(file));
            file_text_readln(file);
            player_y = real(file_text_read_string(file));
            
        }
        else if (line == "___tiles___") {
            file_text_readln(file);
            custom_num_empty = real(file_text_read_string(file));
            file_text_readln(file);
            custom_num_tiles = real(file_text_read_string(file));
            if (file_exists(w + "_tiles.png")) {
                if (sprite_exists(custom_tiles))
                    sprite_delete(custom_tiles);
                custom_tiles = sprite_add(w + "_tiles.png", custom_num_tiles, false, false, 0, 0);
                for (var i = 0; i < ds_list_size(chunk); i++) {
                    createChunkImage(chunk[| i]);
                }
            }
        }
        else if (line == "___spectiles___") {
            file_text_readln(file);
            n = string_digits(file_text_read_string(file));
            while (string_length(n) == 1 || string_length(n) == 2) {
                file_text_readln(file);
                var nx = real(file_text_read_string(file));
                file_text_readln(file);
                var ny = real(file_text_read_string(file));
                var s = instance_create(nx, ny, objSpecTile);
                s.tile = real(n);
                ds_list_add(spectile, s);
                file_text_readln(file);
                n = string_digits(file_text_read_string(file));
            }
        }
        file_text_readln(file);
        line = file_text_read_string(file);
        //show_debug_message(line);
    }
    
    file_text_close(file);
    
    guiDestroy(world_sel_gui);
    exit;
}
else {
    show_message("World files corrupt or do not exist!");
}
