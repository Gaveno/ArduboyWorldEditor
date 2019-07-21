/// writeTile(file, array, frame, frames, a_w, a_h)
// saves a single array as a code image.

var array, frames, aw, ah;
var file = argument0;
array = argument1;
frame = argument2;
aw = argument4;
ah = argument5;
frames = argument3;

/*var frames, frame;
frames = 1;
do {
    frames = max(get_integer("How many frames in sprite? Each sub-image must be divisible by 8", 1), 1);
} until (frames == 1 || (ah / frames) % 8 == 0);*/
//var frame = 0;

//var name = get_string("What will this sprite be called?", "");
//if (name != "") {
    //var fname = get_save_filename("C Header File|*.h", name + ".h");
    //if (fname != "") {
        //var file = file_text_open_write(fname);

        
        //for (var i = 0; i < ah * aw; i++) {
        for (var __y = 0; __y < ah; __y += 8) {
            for (var __x = 0; __x < aw; __x++) {
                // Frames
                if (frames > 1 && __x == 0 && __y % (ah / frames) == 0) {
                    file_text_write_string(file, "   // Frame " + string(frame));
                    file_text_writeln(file);
                    frame++;
                }
                file_text_write_string(file, "   0x" + valueToHex(array[__x + (__y * aw)]) + ",");
                if ( __x == aw - 1 )
                    file_text_writeln(file);
            }
        }
        
        //file_text_close(file);
    //}
//}