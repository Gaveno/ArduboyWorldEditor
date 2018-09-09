/////////////////////////////////////////
//  stringFirstWord(text);
//  returns the first word of a string
// stringFirstWord("Hello World")
// would return "Hello"
/////////////////////////////////////////

var textIn, textOut;
textIn = argument0;
textOut = "";

//show_message(textIn);
if (string_count(" ",textIn) <= 0) {
    return textIn;
if (string_length(textIn) <= 0) {
    return "";
}
} else {
    for (i = 1; i < string_length(textIn); i++) {
        if (string_char_at(textIn,i) != " ") {
            textOut += string_char_at(textIn, i);
        } else {
            //show_message(textOut);
            return textOut;
        }
    }
}
