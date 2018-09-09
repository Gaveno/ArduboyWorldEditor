/// openSelectChunk(show Use button)

var use = argument0;

chunk_sel_gui = guiLoad("ChunkSelect.gui", 100, 100);
var box = guiGetObject(chunk_sel_gui, 2);
box.y -= 3;
box.myHeight += 3;
btn_cs_use = guiGetObject(chunk_sel_gui, 7);
btn_cs_use.tooltip = "Use selected chunk for region#or specific chunk placement.";
if (!use)
    btn_cs_use.visible = false;
btn_cs_next = guiGetObject(chunk_sel_gui, 4);
btn_cs_prev = guiGetObject(chunk_sel_gui, 5);
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
var spacing = 7;
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
    if (chunk_selected == i)
        btn_cs_chunk[i].myColor = c_green;
}
