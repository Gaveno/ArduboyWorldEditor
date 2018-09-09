///////////////////////////////////////////
//  guiList_DeleteItem(listObj, index);
//  deletes an item from a list
///////////////////////////////////////////

var listObj, index;
listObj = argument0;
index = argument1;

ds_list_delete(listObj.myList,index);
listObj.myListMaxOffset = ds_list_size(listObj.myList)*listObj.myListSep;
