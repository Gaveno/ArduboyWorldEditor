/// wl(file, string)

var file = argument0;
var str = argument1;
var rstr = "";

for (var i = 1; i <= string_length(str); i++) {
    if (string_char_at(str, i) == "
") {
        file_text_write_string(file, rstr);
        rstr = "";
        file_text_writeln(file);
        //i++;
    }
    else {
        if (string_char_at(str, i) == "\" && string_char_at(str, i + 1) == "p") {
            rstr += "#";
            i++;
        }
        else if (string_char_at(str, i) == "\" && string_char_at(str, i + 1) == "q") {
            rstr += '"';
            i++;
        }
        else {
            rstr += string_char_at(str, i);
        }
    }
}

file_text_write_string(file, rstr);
file_text_writeln(file);
