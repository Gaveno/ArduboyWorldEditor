//////////////////////////////////////
//  guiList_Select(listObj, index);
//  selects list item index based on
//  list type
//////////////////////////////////////

var listObj, index;

listObj = argument0;
index = argument1;

if (ds_list_size(listObj.myList) <= index) {
    return -1;
}

if (listObj.myListType == 0 || listObj.myListType = 1) {
    listObj.myReleased = index;
}

if (listObj.myListType = 2) {
    var text, char;
    text = ds_list_find_value(listObj.myList,index);
    char = string_char_at(text,string_length(text));
    text = string_copy(text,1,string_length(text)-1);
    //show_message(char+" "+text);
    if (char == "F") {
        //show_message("T");
        text += "T";
    } else {
        //show_message("F");
        text += "F";
    }
    ds_list_replace(listObj.myList,index,text);
}
