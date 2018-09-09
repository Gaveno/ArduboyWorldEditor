/// drawSpecObject()
// draw code for specific object

draw_self();



if (objControl.btn_show_objects.myChecked) {
    draw_set_alpha(0.3);
    draw_set_color(c_yellow);
    draw_rectangle(x, y, x + 15, y + 15, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_font(fontMicro);
    drawTooltipPos(x - 17, y - 17, name, true);
}


