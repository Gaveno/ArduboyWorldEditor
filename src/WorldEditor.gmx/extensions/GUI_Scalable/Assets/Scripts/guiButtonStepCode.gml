///////////////////////////
//  guiButtonStepCode();
//
//  sets the button to
//  pressed or not
//
///////////////////////////

//mouseguix = xtoguix(mouse_x);
//mouseguiy = ytoguiy(mouse_y);
if (myReleased) {
    myReleased = false;
}
if (myGUI.Visible && fake = false) {

/*if (os_type == os_ios || os_type = os_android) {
    x_av = device_mouse_raw_x(0);
    y_av = device_mouse_raw_y(0);
} else {
    //x_av = (mouse_x-view_xview)*2;
    //y_av = (mouse_y-view_yview)*2;
    x_av = window_mouse_get_x();
    y_av = window_mouse_get_y();
}
mouseguix = x_av;
mouseguiy = y_av;*/

mouseguix = mouse_x;
mouseguiy = mouse_y;


if (os_type == os_windows)
{
if (myGUI.myFocus && mouseguix > x && mouseguix < x+myWidth) &&
    (mouseguiy > y && mouseguiy < y+myHeight) {
    if (mouse_check_button_pressed(mb_left) && !myPressed) {
        myPressed = true;
        myStateChange = true;
    }
    if (mouse_check_button_released(mb_left) && myPressed) {
        myPressed = false;
        myReleased = true;
        myStateChange = true;
    }
} else {
    if (myPressed) {
        myStateChange = true;
        myPressed = false;
    }
}
}
else
{
    var t, x_av, y_av;
    t[0] = device_mouse_check_button(0, mb_left);   //For condensing code; shortcuts for long function
    //t[1] = device_mouse_check_button(1, mb_left);   //^
    x_av = 0;   //Init to 0; if not touched nothing will be pressed
    y_av = 0;   //^
    
    //          Set touch position as
    //          device x and y touch values
    //if (t[0])
    //{
        x_av = device_mouse_raw_x(0);
        y_av = device_mouse_raw_y(0);
    //}
    /*if (t[1])                               // The second finger press takes priority
    {
        x_av = device_mouse_raw_x(1);
        y_av = device_mouse_raw_y(1);
    }*/
    
    if (point_in_rectangle(x_av,y_av, x, y, x+myWidth,y+myHeight) && myGUI.myFocus)
    {
        if ((device_mouse_check_button_pressed(0, mb_left)) && !myPressed)
        {
            myPressed = true;
            myStateChange = true;
        }
        if ((device_mouse_check_button_released(0, mb_left)) && myPressed)
        {
            myPressed = false;
            myReleased = true;
            myStateChange = true;
        }
    }
    else
    {
        if (myPressed)
        {
            myStateChange = true;
            myPressed = false;
        }
    }
    
    //global.tl_prev[0] = device_mouse_check_button(0, mb_left);
    //global.tl_prev[1] = device_mouse_check_button(1, mb_left);
}

}
