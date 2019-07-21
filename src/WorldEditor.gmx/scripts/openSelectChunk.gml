/// openSelectChunk(show Use button)

var use = argument0;
if (!use)
    specific_chunk = noone;

chunk_sel_gui = guiLoad("ChunkSelect.gui", 100, 80);
guiMoveTo(chunk_sel_gui, display_get_gui_width() / 2 - chunk_sel_gui.myWidth / 2, display_get_gui_height() / 2 - chunk_sel_gui.myHeight / 2);
var box = guiGetObject(chunk_sel_gui, 2);
box.y -= 3;
box.myHeight += 3;
btn_cs_use = guiGetObject(chunk_sel_gui, 7);
btn_cs_use.tooltip = "Use selected chunk for region#or specific chunk placement.";
if (!use)
    btn_cs_use.visible = false;
btn_cs_next = guiGetObject(chunk_sel_gui, 4);
btn_cs_prev = guiGetObject(chunk_sel_gui, 5);
btn_cs_nnext = guiGetObject(chunk_sel_gui, 11);
btn_cs_pprev = guiGetObject(chunk_sel_gui, 12);
btn_cs_cancel = guiGetObject(chunk_sel_gui, 6);
if (!use)
    btn_cs_cancel.myText = "CLOSE";
btn_cs_new = guiGetObject(chunk_sel_gui, 8);
btn_cs_new.tooltip = "Create a new blank chunk."
btn_cs_edit = guiGetObject(chunk_sel_gui, 9);
btn_cs_edit.tooltip = "Edit the selected chunk changing#the tiles it uses or it's name.";
btn_cs_del = guiGetObject(chunk_sel_gui, 10);
btn_cs_del.tooltip = "Permanently delete the selected chunk.#This cannot be undone!";
btn_cs_chunk[0] = guiGetObject(chunk_sel_gui, 3);
btn_cs_chunk[0].visible = true;

with objChunk {
    times_used = 0;
}
with objRegion {
    event_user(0);
}

var spacing = 4;
scroll = 0;
for (var i = 1; i < ds_list_size(chunk); i++) {
    btn_cs_chunk[i] = guiDuplicateElement(chunk_sel_gui, btn_cs_chunk[i - 1],
                                        btn_cs_chunk[0].x,
                                        btn_cs_chunk[i - 1].y + btn_cs_chunk[0].myHeight + spacing);
}
if (ds_list_size(chunk) == 0) {
    btn_cs_chunk[0].visible = false;
}
for (var i = 0; i < ds_list_size(chunk); i++) {
    btn_cs_chunk[i].myChunk = chunk[| i];
    btn_cs_chunk[i].sprite_index = chunk[| i].sprite_index;
    btn_cs_chunk[i].myText = chunk[| i].name;
    btn_cs_chunk[i].starty = btn_cs_chunk[i].y;
    btn_cs_chunk[i].num_spec = 0;
    btn_cs_chunk[i].num_reg = chunk[| i].times_used;
    btn_cs_chunk[i].myDrawScript = drawChunkStat;
    for (var s = 0; s < ds_list_size(specchunk); s++) {
        if (specchunk[| s].myChunk == btn_cs_chunk[i].myChunk) {
            btn_cs_chunk[i].num_spec++;
        }
    }
    if (chunk_selected == i)
        btn_cs_chunk[i].myColor = c_green;
}
