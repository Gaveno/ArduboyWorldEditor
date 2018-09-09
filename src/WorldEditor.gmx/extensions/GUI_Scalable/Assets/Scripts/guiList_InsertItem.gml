///////////////////////////////////
//  guiList_InsertItem(listObj, pos, text, sprite);
//  inserts an item into the list at pos with
//  text and optional sprite
//  sprite should be a string of
//  the name of the sprite used
//  text is required but can be
//  a space " ".
///////////////////////////////////

var text, sprite, listObj, pos;

listObj = argument[0];
pos = argument[1];
text = argument[2];
if (argument_count > 3) {
    sprite = argument[3];
} else {
    sprite = "-1";
}

if (listObj.myListType == 0 || listObj.myListType == 1) {
    ds_list_insert(listObj.myList,pos,text+"\e"+sprite);
}
if (listObj.myListType == 2) {
    ds_list_add(listObj.myList,pos,text+"\e"+sprite+"\eF");
}

listObj.myListMaxOffset = ds_list_size(listObj.myList)*listObj.myListSep;
