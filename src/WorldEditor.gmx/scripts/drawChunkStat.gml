/// drawChunkStat()
// Draws text with information on a chunks usage.
// Needs to be called by btn_cs_chunk objects.

/*if (rectangle_in_rectangle(x, y, x + myWidth, y + myHeight, myGUI.x,
    myGUI.y, myGUI.x + myGUI.myWidth, myGUI.y + myGUI.myHeight)) {
    var num_spec = 0;
    for (var i = 0;
}*/

var xx = round(x - myGUI.x);
var yy = round(y - myGUI.y);
draw_set_font(fontSmall);
draw_set_color(c_black);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

var text = "Usage#Specific: " + string(num_spec)
    + "#Region: " + string(num_reg);

draw_text(xx + myWidth - 3, yy + myHeight - 3, text);
