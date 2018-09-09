/////////////////////////////////
//  valueToHex(val);
//  converts a byte into a hex
//  character

val = argument0;
//first = val - (floor(val / 16) * 16);
//second = first - (floor(first / 16) * 16);
first = val mod 16;
if (val > 15)
    second = floor(val / 16) mod 16;
else
    second = 0;

//show_debug_message("first "+string(first));
//show_debug_message("second "+string(second));

if (second > 9)
{
    switch (second)
    {
        case 10: strout = "A"; break;
        case 11: strout = "B"; break;
        case 12: strout = "C"; break;
        case 13: strout = "D"; break;
        case 14: strout = "E"; break;
        case 15: strout = "F"; break;
    }
} else {
    strout = string(second);
}
//show_debug_message("strout "+strout);

if (first > 9)
{
    switch (first)
    {
        case 10: strout += "A"; break;
        case 11: strout += "B"; break;
        case 12: strout += "C"; break;
        case 13: strout += "D"; break;
        case 14: strout += "E"; break;
        case 15: strout += "F"; break;
    }
} else {
    strout += string(first);
} 
//show_debug_message("strout "+strout);

//show_debug_message("Converted");
//show_debug_message("byte "+string(val)+" -> hex "+strout);

return strout;
