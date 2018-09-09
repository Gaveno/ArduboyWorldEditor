///////////////////////
//  guiListStep();
//  the step event
//  for gui lists
///////////////////////

if (myScrollSpeed > myListFriction) {
    myScrollSpeed -= myListFriction;
    myStateChange = true;
}
if (myScrollSpeed < -myListFriction) {
    myScrollSpeed += myListFriction;
    myStateChange = true;
}

if (abs(myScrollSpeed) <= myListFriction) {
    myScrollSpeed = 0;
    myStateChange = true;
}

if (abs(myScrollSpeed) > 0) {
    myListOffset += myScrollSpeed;
    myStateChange = true;
}

if (myListOffset > myListMaxOffset) {
    myListOffset -= (myListOffset-myListMaxOffset)/2;
    myScrollSpeed = 0;
    myStateChange = true;
}
if (myListOffset < 0) {
    myScrollSpeed = 0;
    myListOffset += abs(myListOffset/2);
    round(myListOffset);
    myStateChange = true;
}

if (myReleased && myListType == 0) {
    myReleased = -1;
}
if (myGUI.Visible && fake = false) {
if (point_in_rectangle(mouse_x,mouse_y,x,y,x+myWidth,y+myHeight)) {
    if (myPressed) {
        myPressX[0] = myPressX[1];
        myPressY[0] = myPressY[1];
        myPressX[1] = mouse_x;
        myPressY[1] = mouse_y;
        /*if (myPressY[1]-myPressY[0] < 0) {
            myScrollDir = 90;
        } else {
            myScrollDir = 270;
        }*/
        myScrollSpeed = myPressY[0]-myPressY[1];
        if (point_distance(myPressX[0],myPressY[0],myPressX[1],myPressY[1]) > 1) {
            myListBigMove = true;
        }
    }
    if (mouse_check_button_pressed(mb_left) && !myPressed) {
        myPressed = true;
        myPressX[0] = mouse_x;
        myPressY[0] = mouse_y;
        myPressX[1] = mouse_x;
        myPressY[1] = mouse_y;
        myListBigMove = false;
        //myStateChange = true;
    }
    if (mouse_check_button_released(mb_left) && myPressed) {
        myPressed = false;
        myReleased = true;
        myStateChange = true;
        if (myListBigMove = false) {
            guiList_Select(id,ceil((mouse_y-y+myListOffset)/myListSep)-1);
        }
    }
} else {
    if (myPressed) {
        myStateChange = true;
        myPressed = false;
    }
}

}
