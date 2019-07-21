/// drawTooltip(string, [ignore timer])

var timer = false;
var str = argument[0];
if (argument_count > 1) timer = argument[1];



if (timer || objControl.tooltip <= 0) {
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_set_font(fontSmall);
    var xx = device_mouse_x_to_gui(0) + 16;
    var yy = device_mouse_y_to_gui(0) - 16;
    
    /*if (xx + string_width(str) + 3 > view_wview) {
        xx = view_wview-6-string_width(str);
    }
    if (yy + string_height(str) + 3 > view_hview) {
        yy = view_hview-6-string_height(str);
    }*/
    xx = clamp(xx, 0, display_get_gui_width()-6-string_width(str));
    yy = clamp(yy, 0, display_get_gui_height()-6-string_height(str))

    draw_rectangle(xx - 3, yy - 3, xx + string_width(str) + 3,
                 yy + string_height(str) + 3, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(xx, yy, str);
}
