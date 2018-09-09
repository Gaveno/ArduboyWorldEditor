///////////////////////////////////////
//  guiLoad(fname, x, y);
//  loads the guiID to fname
//
//  version 1.01
///////////////////////////////////////

var guiID, fname, file, read, i, listsize;

xx = argument1;
yy = argument2;
guiID = instance_create(xx,yy,objGUIBase);
//guiID.myWidth = width;
//guiID.myHeight = height;
guiID.Visible = true;
guiID.myUpdate = true;
//guiID.mySurf = surface_create(width,height);
//surface_set_target(guiID.mySurf);
//draw_clear_alpha(c_white,0);
//surface_reset_target();
guiID.myDrawList = ds_list_create();
guiID.scale = 1;
guiID.scalex = 1;
guiID.scaley = 1;

fname = argument0;

file = file_bin_open(fname, 0);

read = file_bin_read_byte(file);
if (read != ord("G"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("U"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("I"))
    return -1;
read = file_bin_read_byte(file); //blank
read = file_bin_read_byte(file);
if (read != ord("0"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("1"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("."))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("0"))
    return -1;
read = file_bin_read_byte(file);
if (read != ord("1"))
    return -1;
read = file_bin_read_byte(file);
read = file_bin_read_byte(file);
read = file_bin_read_byte(file); //end of first blanks

guiID.myWidth = file_bin_read_short(file);
guiID.myHeight = file_bin_read_short(file);
//show_debug_message("width: "+string(guiID.myWidth)+" height: "+string(guiID.myHeight));

guiID.mySurf = surface_create(guiID.myWidth,guiID.myHeight);
surface_set_target(guiID.mySurf);
draw_clear_alpha(c_white,0);
surface_reset_target();

listsize = file_bin_read_short(file); //drawlist size
//show_message("listsize: "+string(listsize));


for (i=0;i<listsize;i++) {
    var obj, r, g, b;
    //obj = ds_list_find_value(guiID.myDrawList,i);
    read = file_bin_read_byte(file);
    if (read == GUI_TYPE_BUTTON) {
        obj = guiAddButton(guiID,0,0,0,0,c_white," ",c_white,fontNormal);
    } else {
        if (read == GUI_TYPE_LIST) {
            obj = guiAddList(guiID,0,0,0,0,c_white,0);
            ds_list_read(obj.myList,file_bin_read_string(file));
            obj.myListType = file_bin_read_byte(file);
            obj.myListSep = file_bin_read_short(file);
            obj.myListSnap = file_bin_read_byte(file);
        } else { //box
            obj = guiAddBox(guiID,0,0,0,0,c_white," ",c_white,fontNormal);
        }
    }
    //show_message("read: "+string(read));
    read = file_bin_read_byte(file); //index
    //show_message("read: "+string(read));
    obj.myWidth = file_bin_read_short(file);
    //show_message("width: "+string(obj.myWidth));
    obj.myHeight = file_bin_read_short(file);
    //show_message("height: "+string(obj.myHeight));
    r = file_bin_read_byte(file);
    g = file_bin_read_byte(file);
    b = file_bin_read_byte(file);
    obj.myColor = make_color_rgb(r,g,b);
    //show_message("Color: "+string(obj.myColor));
    obj.myText = file_bin_read_string(file);
    //show_message("text: "+obj.myText);
    r = file_bin_read_byte(file);
    g = file_bin_read_byte(file);
    b = file_bin_read_byte(file);
    obj.myTextCol = make_color_rgb(r,g,b);
    obj.myFont = asset_get_index(file_bin_read_string(file));
    obj.myCustomScript = file_bin_read_string(file);
    obj.myPressedCol = file_bin_read_short(file);
    obj.myTextStretched = file_bin_read_byte(file);
    obj.myTextPos = file_bin_read_byte(file);
    if (obj.myTextPos < 1) {
        obj.myTextPos = 5;
    }
    obj.mySpritePos = file_bin_read_byte(file);
    obj.myOnlyText = file_bin_read_byte(file);
    obj.myCornerRadius = file_bin_read_byte(file);
    obj.x = file_bin_read_short(file)-300+xx;
    obj.y = file_bin_read_short(file)-300+yy;
    obj.myAlpha_Back = file_bin_read_byte(file) / 100;
    obj.myAlpha_Border = file_bin_read_byte(file) / 100;
    obj.myAlpha_Text = file_bin_read_byte(file) / 100;
    obj.fake = false;
}

file_bin_close(file);
return guiID;
