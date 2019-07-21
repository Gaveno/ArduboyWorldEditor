/// writeChunks(file, list);

var file = argument0;
var list = argument1;

file_text_write_string(file, "const unsigned char PROGMEM chunks[] = ");
file_text_writeln(file);
file_text_write_string(file, "{");
file_text_writeln(file);
file_text_write_string(file, "   // number of chunks: " + string(ds_list_size(list)));
file_text_writeln(file);
file_text_write_string(file, "   // number of tiles in chunks: " + string(NUM_TILES_IN_CHUNK));
file_text_writeln(file);
file_text_write_string(file, "   // space used by chunks: " + string(ds_list_size(list) * NUM_TILES_IN_CHUNK) + " bytes");
file_text_writeln(file);

// write chunk data
/*for (var i = 0; i < ds_list_size(list); i++) {
    file_text_write_string(file, "   // chunk: " + string(i));
    file_text_writeln(file);
    file_text_write_string(file, "   // chunk name: " + list[| i].name);
    for (var a = 0; a < NUM_TILES_IN_CHUNK; a++) {
        if (a % 6 == 0) {
            file_text_writeln(file);
            file_text_write_string(file, "  ");
        }
        file_text_write_string(file, "0x" + valueToHex(list[| i].tile[a]) + ", ");
        
    }
    file_text_writeln(file);
}*/

// Only the first 16 tiles can be used in a chunk
for (var i = 0; i < ds_list_size(list); i++) {
    file_text_write_string(file, "  // chunk: " + string(i));
    file_text_writeln(file);
    file_text_write_string(file, "  // chunk name: " + list[| i].name);
    for (var a = 0; a < NUM_TILES_IN_CHUNK; a+=2) {
        if (a % 6 == 0) {
            file_text_writeln(file);
            file_text_write_string(file, "  ");
        }
        file_text_write_string(file, "0x" + valueToHex(list[| i].tile[a] | (list[| i].tile[a+1] << 4)) + ", ");
        
    }
    file_text_writeln(file);
}

file_text_write_string(file, "};");
file_text_writeln(file);
