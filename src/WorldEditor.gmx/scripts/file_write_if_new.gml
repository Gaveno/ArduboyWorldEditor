/// file_write_if_new(filename, string);
// writes a string to a file as a new line if
// it does not already exist

var filename = argument0;
var file;
var str = argument1;
var exists = false;

// scan file
if (file_exists(filename)) {
    file = file_text_open_read(filename);
    while(!file_text_eof(file)) {
        var line = file_text_read_string(file);
        file_text_readln(file);
        if (line == str) exists = true;
    }
    
    file_text_close(file);
}

if (!exists) {
    file = file_text_open_append(filename);
    file_text_writeln(file);
    file_text_write_string(file, str);
    file_text_close(file);
}
