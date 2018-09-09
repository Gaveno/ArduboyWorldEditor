/////////////////////////////////////////////
//  stringChop(text, sep_str);
//  returns the text chopped at sep_str
// stringChop("Hello World", " ")
// would return "Hello"
/////////////////////////////////////////

var textIn, textOut, sep_chr, ll;
textIn = argument0;
sep_chr = argument1;
textOut = "";
ll = string_length(sep_chr);

//show_message(textIn);
if (string_count(sep_chr,textIn) <= 0) {
    return textIn;
}
if (string_length(textIn) <= 0) {
    return "";
}
else {
    for (i = 1; i < string_length(textIn); i++) {
        if (string_copy(textIn,i,ll) != sep_chr) {
            textOut += string_char_at(textIn, i);
        } else {
            break;
        }
    }
}
return textOut;
