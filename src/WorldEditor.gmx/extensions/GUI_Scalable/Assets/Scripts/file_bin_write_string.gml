///////////////////////////////////////////////
//  file_bin_write_string(fileID, string);
//  writes a string to a binary file enclosed
//  in "ÿ"
///////////////////////////////////////////////

var fileID, text, i;

fileID = argument0;
text = argument1;

//file_bin_write_byte(fileID,ord("ÿ"));
for (i = 1; i <= string_length(text); i++) {
    file_bin_write_byte(fileID,ord(string_char_at(text,i)));
}
file_bin_write_byte(fileID,ord("ÿ"));
