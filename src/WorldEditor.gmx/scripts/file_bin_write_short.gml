////////////////////////////////////////////
//  file_bin_write_short(fileID, value);
//  writes a short to the open binary file
////////////////////////////////////////////

var fileid, val;

fileid = argument0;
val = argument1;

file_bin_write_byte(fileid,val & 255);
file_bin_write_byte(fileid, (val >> 8) & 255);
