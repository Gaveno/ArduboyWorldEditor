/// getSolidState(cx, cy)
// returns whether the chunk at room cx, cy
// (in chunk coordinates) is solid or not

var cx = argument0;
var cy = argument1;

var index = cx + cy * 32;

if (index < 0 || index >= 1024)
    return 1;

return objControl.chunk_state[index];
