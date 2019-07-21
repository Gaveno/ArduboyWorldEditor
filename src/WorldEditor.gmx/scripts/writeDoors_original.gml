/// writeDoors(file)

var file = argument0;

var num_doors = 0;
for (var i = 0; i < ds_list_size(specobject); i++) {
    if (specobject[| i].image_index == 3) {
        num_doors++;
    }
}

wl(file, "
\pdefine TOTAL_DOORS   " + string(num_doors) + "

const unsigned char PROGMEM doors[] = 
{");
for (var i = 0; i < ds_list_size(specobject); i++) {
    if (specobject[| i].destx >= 0 && specobject[| i].desty >= 0) {
        wl(file, "   0x" + valueToHex(floor(specobject[| i].x / 16)) +
            ", 0x" + valueToHex(floor(specobject[| i].y / 16)) +
            ", 0x" + valueToHex(floor(specobject[| i].destx)) +
            ", 0x" + valueToHex(floor(specobject[| i].desty)) + ", // " + specobject[| i].name);
    }
}
wl(file, "};
");

wl(file, "
void checkDoors()
{
    Point p;
    p.x = player.x;
    p.y = player.y;
    for (byte i = 0; i < TOTAL_DOORS * 2; i++)
    {
        Rect door = {.x = pgm_read_byte(doors + i * 2) * 16 - 3, .y = pgm_read_byte(doors + 1 + i * 2) * 16,
                    .width = 10, .height = 10 };

        if (arduboy.collide(p, door))
        {
            int8_t offset = 2; // exterior
            if (i % 2 == 1) offset = -2; // interior
            player.x = pgm_read_byte(doors + offset + i * 2) * 16;
            player.y = (pgm_read_byte(doors + offset + 1 + i * 2)) * 16 - (offset * 6);
            player.walking = false;
        }
    }
}");
