//////////////////////////////////////////
//  file_bin_read_short(fileID);
//  reads 2 bytes to create a short value
//  returns the short
//////////////////////////////////////////

var fileID, val;

fileID = argument0;
//val = argument1;

val = file_bin_read_byte(fileID);
val = val | (file_bin_read_byte(fileID) << 8);

return val;
