/// writeRegions(file, save image);

var file = argument0;
var savei = argument1;

file_text_writeln(file);
file_text_writeln(file);
file_text_writeln(file);
file_text_writeln(file);

wl(file, "\pdefine TOTAL_REGIONS     " + string(ds_list_size(region)));
wl(file, "\pdefine LEVEL_CHUNK_W    32");
wl(file, "\pdefine LEVEL_CHUNK_H    32");
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "const unsigned char PROGMEM regions[] = ");
file_text_writeln(file);
file_text_write_string(file, "{");
file_text_writeln(file);

// arrange regions by depth
var ordered_regions = ds_list_create();
ds_list_add(ordered_regions, region[| 0]);
for (var i = 1; i < ds_list_size(region); i++) {
    var placed = false;
    for (var a = 0; a < ds_list_size(ordered_regions); a++) {
        if (!placed) {
            if (region[| i].depth < ordered_regions[| a].depth) {
                placed = true;
                ds_list_insert(ordered_regions, a, region[| i]);
            }
        } 
    }
    if (!placed) {
        ds_list_add(ordered_regions, region[| i]);
    }
}

//write region coordinates
for (var i = 0; i < ds_list_size(ordered_regions); i++) {
    file_text_write_string(file, "  // region: " + string(i));
    file_text_writeln(file);
    file_text_write_string(file, "  // region name: " + ordered_regions[| i].name);
    file_text_writeln(file);
    file_text_write_string(file, "  0x" + valueToHex(ordered_regions[| i].x) + ", ");
    file_text_write_string(file, "0x" + valueToHex(ordered_regions[| i].y) + ", ");
    file_text_write_string(file, "0x" + valueToHex(ordered_regions[| i].width) + ", ");
    file_text_write_string(file, "0x" + valueToHex(ordered_regions[| i].height) + ", ");
    file_text_writeln(file);
}
file_text_write_string(file, "};");
file_text_writeln(file);
file_text_writeln(file);
file_text_writeln(file);

//write solid map
file_text_write_string(file, "const unsigned char PROGMEM solid_map[] = ");
file_text_writeln(file);
file_text_write_string(file, "{");
for (var a = 0; a < world_size; a += 8) {
    if (a % 32 == 0) {
        file_text_writeln(file);
        file_text_write_string(file, "  ");
    }
    var byte = 0;
    for (var b = 0; b < 8; b++) {
        byte |= chunk_state[a + b] << b;
    }
    file_text_write_string(file, "0x" + valueToHex(byte) + ", ");
}
file_text_writeln(file);
file_text_write_string(file, "};");
file_text_writeln(file);
file_text_writeln(file);
file_text_writeln(file);

wl(file, "
byte getChunk(const Point &chunk_pos);
bool getChunkBit(const byte &chunk_x, const byte &chunk_y);
byte getTileInChunk(const byte &chunk, const Point &tile_pos);
Point world_to_chunk(const Point &world_pos);
bool getSolid(const Point &world_pos);
byte getTileID(const Point &world_pos);
byte getRegion(const Point &chunk_pos);

");

/*int rx = pgm_read_byte(regions + i * 4) * 96;
      int ry = pgm_read_byte(regions + 1 + i * 4) * 96;
      int rw = pgm_read_byte(regions + 2 + i * 4) * 96;
      int rh = pgm_read_byte(regions + 3 + i * 4) * 96;
      
      if (chunk_pos.x >= rx && chunk_pos.x < rx + rw && chunk_pos.y >= ry && wchunk_pos.y < ry + rh)
      {
          return i;
      }*/

// getRegion
wl(file, "
byte getRegion(const Point &chunk_pos)
{
  for (byte i = 0; i < TOTAL_REGIONS; i++)
  {
      Rect reg = {.x = pgm_read_byte(regions + i * 4), .y = pgm_read_byte(regions + 1 + i * 4),
                .width = pgm_read_byte(regions + 2 + i * 4), .height = pgm_read_byte(regions + 3 + i * 4) };
      if (arduboy.collide(chunk_pos, reg)) return i;
  }
  return 255;     // error
}

");

// getTileID
wl(file, "
byte getTileID(const Point &world_pos)
{
    Point chunk_pos = { .x = world_pos.x / 96, .y = world_pos.y / 96 };
    byte chunk = getChunk(chunk_pos);
    byte tile = getTileInChunk(chunk, world_to_chunk(world_pos));
    
    switch(tile)
    {
      case 25: tile += waterframe; break;
      case 26: tile -= waterframe; break;
    }
    
    return tile;
}

");

// getChunkBit
wl(file, "
bool getChunkBit(const byte &chunk_x, const byte &chunk_y)
{
  if (chunk_x < 0 || chunk_x >= LEVEL_CHUNK_W
  || chunk_y < 0 || chunk_y >= LEVEL_CHUNK_H)
    return 1;
    
  byte x = chunk_x / 8;           // 8 is number of chunks per byte
  byte y = chunk_y * 4;           // 4 is number of bytes per row
  byte i = chunk_x % 8;

  byte b = (pgm_read_byte(solid_map + x + y) & _BV(i));
  return (b > 0);
}

");

// getTileInChunk
wl(file, "
byte getTileInChunk(const byte &chunk, const Point &tile_pos)
{
  return pgm_read_byte(chunks + ((chunk & 0x7F) * 36) + tile_pos.x + tile_pos.y * 6);
}

");

// getSolid
wl(file, "
bool getSolid(const Point &world_pos)
{
  return (getTileID(world_pos) >= 8);
}

");

// getSolid
wl(file, "
bool getSolid(const int &world_x, const int &world_y)
{
  Point world_pos = {.x = world_x, .y = world_y };
  return (getTileID(world_pos) >= 8);
}

");

// world_to_chunk
wl(file, "
Point world_to_chunk(const Point &world_pos)
{
    Point out = {.x = (world_pos.x % 96) / 16, .y = (world_pos.y % 96) / 16 };
    return out;
}

");




// getChunk
wl(file, "
// getChunk
// Returns a value greater than 127 if the chunk was specifically placed.
// If the chunk is part of a region the returned value will be
// less than 128.
// To get the actual chunk value of a specific chunk, AND (&) the returned
// chunk with 0x7F (B01111111)
byte getChunk(const Point &chunk_pos)
{
    // specific chunks
    switch (chunk_pos.x + chunk_pos.y * 32)
    {");

// specific chunks
for (var i = 0; i < ds_list_size(specchunk); i++) {
    file_text_write_string(file, "        case " + string(floor(specchunk[| i].x / 96) + floor(specchunk[| i].y / 96) * 32) + ": return " +
    string(specchunk[| i].myChunk.used_index | 128) + "; break; // " + specchunk[| i].myChunk.name);
    file_text_writeln(file);
}
file_text_write_string(file, "    }");
file_text_writeln(file);
file_text_writeln(file);

// regions
wl(file, "
    // regions
    switch (getRegion(chunk_pos))
    {");
for (var i = 0; i < ds_list_size(ordered_regions); i++) {
    wl(file, "        case " + string(i) + ":  // " + ordered_regions[| i].name + "
        {");
    
    if (ordered_regions[| i].type == 0) { // binary
        wl(file, "            if (!getChunkBit(chunk_pos.x, chunk_pos.y))
            {
                return " + string(ordered_regions[| i].chunks[0].used_index) + ";
            }
            else
            {
                return " + string(ordered_regions[| i].chunks[1].used_index) + ";
            }");
    }
    else if (ordered_regions[| i].type == 1) { // empty defined
        wl(file, "            if (getChunkBit(chunk_pos.x, chunk_pos.y))
            {
                return " + string(ordered_regions[| i].chunks[16].used_index) + ";
            }
            else
            {
                byte b = 0;
                b |= getChunkBit(chunk_pos.x + 1, chunk_pos.y);
                b |= getChunkBit(chunk_pos.x, chunk_pos.y - 1) << 1;
                b |= getChunkBit(chunk_pos.x - 1, chunk_pos.y) << 2;
                b |= getChunkBit(chunk_pos.x, chunk_pos.y + 1) << 3;");
                
                if (ordered_regions[| i].all_used && false) {
                    wl(file, "
                return " + string(ordered_regions[| i].chunks[0].used_index) + " + b;
            }");
                }
                else {
                    wl(file, "
                switch (b)
                {");
                    for (var a = 0; a < 16; a++) {
                        if (ordered_regions[| i].chunks[a].is_used) {
                            wl(file, "                    case " + string(a) + ": return " + string(ordered_regions[| i].chunks[a].used_index) + "; break;");
                        }
                    }
                    file_text_write_string(file, "                }");
                    file_text_writeln(file);
                    file_text_write_string(file, "            }");
                    file_text_writeln(file);
                }
    }
    else if (ordered_regions[| i].type == 2) { // solid defined
        wl(file, "            if (!getChunkBit(chunk_pos.x, chunk_pos.y))
            {
                return " + string(ordered_regions[| i].chunks[16].used_index) + ";
            }
            else
            {
                byte b = 0;
                b |= getChunkBit(chunk_pos.x + 1, chunk_pos.y);
                b |= getChunkBit(chunk_pos.x, chunk_pos.y - 1) << 1;
                b |= getChunkBit(chunk_pos.x - 1, chunk_pos.y) << 2;
                b |= getChunkBit(chunk_pos.x, chunk_pos.y + 1) << 3;");
                
                if (ordered_regions[| i].all_used && false) {
                    wl(file, "
                return " + string(ordered_regions[| i].chunks[0].used_index) + " + b;
            }");
                }
                else {
                    wl(file, "
                switch (b)
                {");
                    for (var a = 0; a < 16; a++) {
                        if (ordered_regions[| i].chunks[a].is_used) {
                            wl(file, "                    case " + string(a) + ": return " + string(ordered_regions[| i].chunks[a].used_index) + "; break;");
                        }
                    }
                    file_text_write_string(file, "                }");
                    file_text_writeln(file);
                    file_text_write_string(file, "            }");
                    file_text_writeln(file);
                }
    }
    
    wl(file, "        } break;");
}

wl(file, "
    }
    return 0; // default chunk
}

");


// create screenshot
if (savei) {
    var surf = surface_create(room_width, room_height);
    var pview_xview = view_xview;
    var pview_yview = view_yview;
    var pview_wview = view_wview;
    var pview_hview = view_hview;
    
    view_xview = 0;
    view_yview = 0;
    view_wview = room_width;
    view_hview = room_height
    
    surface_set_target(surf);
    draw_clear_alpha(c_white, 1);
    
    for (var i = ds_list_size(ordered_regions) - 1; i >= 0; i--) {
        with ordered_regions[| i] {
            drawRegion();
        }
    }
    for (var i = 0; i < ds_list_size(specchunk); i++) {
        with specchunk[| i] {
            drawSpecChunk();
        }
    }
    for (var i = 0; i < ds_list_size(specobject); i++) {
        with specobject[| i] {
            drawSpecObject();
        }
    }
    
    surface_reset_target();
    
    view_xview = pview_xview;
    view_yview = pview_yview;
    view_wview = pview_wview;
    view_hview = pview_hview;
    
    surface_save(surf, "saves\" + world_external_name + "_world.png");
    
    surface_free(surf);
    
    var savename = get_save_filename_ext("PNG Image File|*.png", world_internal_name + ".png", program_directory, "Save Image As...");
    if (is_string(savename) && string_length(savename) > 0) {
        file_copy("saves\" + world_external_name + "_world.png", savename);
        //file_copy("saves\" + world_external_name + "_world.png", filename_path(savename) + stringChopN(savename, ".", 0) + ".png")
    }
}

ds_list_destroy(ordered_regions);
