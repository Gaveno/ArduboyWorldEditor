//////////////////////////////////////////
//  guiList_CheckSelected(listObj,pos);
//  checks if the pos in a list is
//  selected.
//////////////////////////////////////////

var listObj, pos;
listObj = argument0;
pos = argument1;

if (pos >= ds_list_size(listObj.myList))
    return false;

if (listObj.myListType <= 1 && listObj.myReleased == pos)
    return true;

if (listObj.myListType == 2) {
    var text, char;
    text = ds_list_find_value(listObj.myList,pos);
    char = string_char_at(text,string_length(text));
    if (char == "F") {
        return false;
    } else {
        return true
    }
}
