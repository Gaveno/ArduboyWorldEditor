/////////////////////////////////////////////
//  file_bin_read_string(fileID);
//  reads a string from a binary file
//  the string ends with character "ÿ"
//  returns string
//////////////////////////////////////////////

var fileID, text, next;

fileID = argument0;
text = "";

next = file_bin_read_byte(fileID);
while(next != ord("ÿ"))// && file_bin_position(fileID) != file_bin_size(fileID)) {
{
    //show_message("char: "+chr(next));
    //show_message("string: "+string(next));
    text += chr(next);
    next = file_bin_read_byte(fileID);
    //show_message("text: "+text);
}

return text;
