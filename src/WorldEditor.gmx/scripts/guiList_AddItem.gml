///////////////////////////////////
//  guiList_AddItem(listObj, text, sprite);
//  adds an item to the list with
//  text and optional sprite
//  sprite should be a string of
//  the name of the sprite used
//  text is required but can be
//  a space " ".
///////////////////////////////////

var text, sprite, listObj;

listObj = argument[0];
text = argument[1];
if (argument_count > 2) {
    sprite = argument[2];
} else {
    sprite = "-1";
}

if (listObj.myListType == 0 || listObj.myListType == 1) {
    ds_list_add(listObj.myList,text+"\e"+sprite);
}
if (listObj.myListType == 2) {
    ds_list_add(listObj.myList,text+"\e"+sprite+"\eF");
}

listObj.myListMaxOffset = ds_list_size(listObj.myList)*listObj.myListSep;
