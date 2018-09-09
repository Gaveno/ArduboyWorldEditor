/////////////////////////////////////////////
//  stringChopN(text, sep_chr, N);
//  returns the Nth occurance
// of text chopped at sep_chr
// stringChop("Hello World, what up?", " ", 2)
// would return "what"
/////////////////////////////////////////

var textIn, textOut, sep_chr, N, nC, ll;
textIn = argument0;
sep_chr = argument1;
N = argument2;
textOut = "";
ll = string_length(sep_chr);
nC = 0;

//show_message(textIn);
if (string_count(sep_chr,textIn) <= 0) {
    return textIn;
if (string_length(textIn) <= 0) {
    return "";
}
} else {
    repeat(N) {
        textOut = stringChop(textIn,sep_chr);
        show_debug_message(textOut);
        var l1, l2;
        l1 = string_length(textOut)+ll+1;
        l2 = string_length(textIn);
        if !(l2-l1 > l2 || l1 > l2)
            textIn = string_copy(textIn,l1,l2-l1+1);
        show_debug_message(textIn);
    }
    if (string_copy(textIn,1,ll) == sep_chr) {
        textIn = string_copy(textIn,ll+1,l2-ll-1);
    }
    textOut = stringChop(textIn,sep_chr);
    
    return textOut;
}
