//x = global.cameraX + 513/2;
//y = global.cameraY + 288/2;

//var newX = lerp(global.cameraViewX, global.cameraGoToX, 0.2)
//var newY = lerp(global.cameraViewY, global.cameraGoToY, 0.2)

//x = newX + 513/2;
//y = newY + 288/2;


/*if (!place_meeting(x, y, obj_testWall)) {
	x = lerp(global.cameraX + 513/2, obj_player.x, 0.8);
	y = lerp(global.cameraY + 288/2, obj_player.y, 0.8);
}
else {
	x = lerp(x, obj_player.x, 0.1);
	y = lerp(y, obj_player.y, 0.1);
}*/

//Player Key Inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

//Player Movement
var move_horizontal = key_right - key_left;
var move_vertical = key_down - key_up;

if(endgame_collision == false){
	hsp = move_horizontal * walkspd;
	vsp = move_vertical * walkspd;
}else{
	hsp = 0;
	vsp = 0;
}

//Collision Detection
//Horizontal
if(place_meeting(x+hsp, y, obj_testWall)){
	while(!place_meeting(x + sign(hsp), y, obj_testWall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}

if(place_meeting(x+hsp, y, obj_door)){
	while(!place_meeting(x + sign(hsp), y, obj_door)){
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Vertical
if(place_meeting(x, y + vsp, obj_testWall)){
	while(!place_meeting(x, y + sign(vsp), obj_testWall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}

if(place_meeting(x, y + vsp, obj_door)){
	while(!place_meeting(x, y + sign(vsp), obj_door)){
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//
if (keyboard_check(vk_right)) {
	x = lerp(obj_player.x, obj_player.x + 20, 0.5);
}
else if (keyboard_check(vk_left)) {
	x = lerp(obj_player.x, obj_player.x-20, 0.5);
}
else if (keyboard_check(vk_up)) {
	y = lerp(obj_player.y, obj_player.y-20, 0.5);
}
else if (keyboard_check(vk_down)) {
	y = lerp(obj_player.y, obj_player.y+20, 0.5);
}