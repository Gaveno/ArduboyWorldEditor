/// writeTiles(file, sprite, array, frames, a_w, a_h)
// saves a single array as a code image.

var array, frames, aw, ah;
var file = argument0;
array = argument2;
frames = argument3;
aw = argument4;
ah = argument5;
var spr = argument1;


/*var frames, frame;
frames = 1;
do {
    frames = max(get_integer("How many frames in sprite? Each sub-image must be divisible by 8", 1), 1);
} until (frames == 1 || (ah / frames) % 8 == 0);*/
var frame = 0;

//var name = get_string("What will this sprite be called?", "");
//if (name != "") {
    //var fname = get_save_filename("C Header File|*.h", name + ".h");
    //if (fname != "") {
        //var file = file_text_open_write(fname);
        file_text_write_string(file, "PROGMEM const unsigned char tileSheet[] = {");
        file_text_writeln(file);
        file_text_write_string(file, "   // Bitmap Image. No transparency");
        file_text_writeln(file);
        file_text_write_string(file, "   // Width: " + string(aw) + " Height: " + string(ah ));
        file_text_writeln(file);
        file_text_write_string(file, "   " +string(aw) + ", " + string(ah) + ", "); // width height
        file_text_writeln(file);
        
        for (var i = 0; i < frames; i++) {
            imageToBytes(spr, i, array);
            writeTile(file, array, i, frames, aw, ah);
        }
        
        file_text_write_string(file, "};");
        file_text_writeln(file);
        //file_text_close(file);
    //}
//}
