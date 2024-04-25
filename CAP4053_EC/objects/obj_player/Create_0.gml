hsp = 0;
vsp = 0;
walkspd = 5;
keys = 0;
keysLeft = 8;
keyCounterDelayX = room_speed * 2;
keyCounterDelayY = room_speed * 2;
endgame_collision = false;


//Viewport Reset
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, -1, -1);
