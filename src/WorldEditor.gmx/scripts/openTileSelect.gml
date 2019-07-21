/// openTileSelect(specific tile)

var st = argument0;

tile_sel_gui = guiLoad("TileSelect.gui", 55, 80);
tile_sel_gui.specific_tile = st;
btn_ts_next = guiGetObject(tile_sel_gui, 2);
btn_ts_next.tooltip = "Show next page of tiles.";
btn_ts_next.visible = false;
btn_ts_prev = guiGetObject(tile_sel_gui, 3);
btn_ts_prev.tooltip = "Show previous page of tiles.";
btn_ts_prev.visible = false;
btn_ts_cancel = guiGetObject(tile_sel_gui, 4);
btn_ts_cancel.tooltip = "Close tile selection without selecting a tile.";
tile_start = 0;
var spr;
if (sprite_exists(custom_tiles)) spr = custom_tiles;
else spr = sprTiles;

btn_ts_tile[0] = guiGetObject(tile_sel_gui, 5);
btn_ts_tile[0].sprite_index = spr;
btn_ts_tile[0].image_speed = 0;
btn_ts_tile[0].image_index = 0;
btn_ts_tile[0].tooltip = "Click to select this tile.";
var i = 1;
var spacing = 1;
for (var yy = 0; yy < 10; yy++) {
    for (var xx = 0; xx < 9; xx++) {
        if (xx > 0 || yy > 0) {
            if (i < sprite_get_number(spr)) {
                btn_ts_tile[i] = guiDuplicateElement(tile_sel_gui, btn_ts_tile[0],
                                btn_ts_tile[0].x + xx * (32 + spacing), btn_ts_tile[0].y + yy * (32 + spacing));
                btn_ts_tile[i].sprite_index = spr;
                btn_ts_tile[i].image_index = i;
            }
            else
                btn_ts_tile[i] = noone;
            i++;
        }
    }
}

/*for (var a = 0; a < 16; a++) {
    btn_ts_tile[a] = guiGetObject(tile_sel_gui, 2 + a);
    btn_ts_tile[a].sprite_index = spr;
    btn_ts_tile[a].image_speed = 0;
    btn_ts_tile[a].image_index = a;
    btn_ts_tile[a].myText = " ";
    btn_ts_tile[a].tooltip = "Click to select this tile.";
}*/
