////////////////////////////////////////
//      guiCheckButton(butID);
//
//      checks butID whether its clicked
//      returns true if just pressed
//      returns false otherwise
//
/////////////////////////////////////////
var butID;
butID = argument0;
if (!instance_exists(butID)) {
    //show_debug_message("Button does not exist");
    return false;
}
//if (butID.myReleased) {
    //show_debug_message("Button: "+string(butID)+" released. Text: "+butID.myText);
//}
return butID.myReleased;
