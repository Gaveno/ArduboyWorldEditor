///////////////////////////////////////////////////////
//              guiDraw();
//
//      draws the gui at it's current position
//      checks for state changes within elements
//          
//          COPYRIGHT 2014 (C) Monkey Studios
////////////////////////////////////////////////////////
var statechange;
statechange = false;

if (!Visible) { //do not check or draw buttons if visible is false
    return 0;
}
if (!myUpdate)
for (i=0;i<ds_list_size(myDrawList);i++) {
    var obj;
    obj = ds_list_find_value(myDrawList,i);
    if (obj.myStateChange || obj.xprevious != obj.x || obj.yprevious != obj.y) {
        statechange = true;
    }
}
if (myUpdate || statechange || !surface_exists(mySurf)) {
    if (!surface_exists(mySurf)) {
        mySurf = surface_create(myWidth,myHeight);
    }
    else
    {
        if (myWidth != surface_get_width(mySurf) || myHeight != surface_get_height(mySurf))
        {
            surface_resize(mySurf, myWidth, myHeight);
        }
    }
    surface_set_target(mySurf);
    draw_clear_alpha(c_white,0);
    for (i=0;i<ds_list_size(myDrawList);i++) {
        var obj;
        obj = ds_list_find_value(myDrawList,i);
        obj.myStateChange = false;
        if (obj.visible) 
            if (obj.myCustomScript == " " || !script_exists(asset_get_index(obj.myCustomScript))) {
                if (rectangle_in_rectangle(obj.x, obj.y, obj.x+obj.myWidth, obj.y+obj.myHeight, x, y, x+myWidth, y+myHeight))
                    guiDrawElement(obj);
            }
            else {
                script_execute(asset_get_index(obj.myCustomScript),obj);
            }
        //show_message("drawing gui object: "+string(obj));
    }
    
    /*draw_set_blend_mode(bm_subtract);
    draw_set_alpha(0);
    draw_sprite_part(sprCanvas, 0, 0, 0, myWidth, myHeight, 0, 0);
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);*/
    surface_reset_target();
}
myUpdate = false;
draw_surface(mySurf,round(x),round(y));
