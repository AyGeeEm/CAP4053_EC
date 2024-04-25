//Viewport Setup
var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
//cameraHor = _hor;
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);
//cameraVer = _ver;

var _viewX = camera_get_view_x(view_camera[0]);
//cameragetX = _viewX;
var _viewY = camera_get_view_y(view_camera[0]);
//cameragetY = _viewY;
var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);

var _gotoX = x + (_hor * 150) - (_viewW * 0.5);
//cameraGoToX = _gotoX;
var _gotoY = y + (_ver * 100) - (_viewH * 0.5);
//cameraGoToY = _gotoY;

var _newX = lerp(_viewX, _gotoX, 0.1);

var timerStart = room_speed * 2;
var timerMin = 0;
//keyCounter Text Horizontal Movement
if(keyCounterDelayX > 0){
	var counterX = lerp(_viewX, _gotoX, 0.01);
	cameraX = counterX;
}

if(_hor != 0){
	var counterX = lerp(_viewX, _gotoX, 0.1);
	cameraX = counterX;
	if((keyCounterDelayX > 0) && (keyCounterDelayX == timerStart)){
		keyCounterDelayX--;
	}
}
if (keyCounterDelayX < timerStart){
	var counterX = lerp(_viewX, _gotoX, 0.1);
	cameraX = counterX;
	if(keyCounterDelayX != timerMin){
		keyCounterDelayX--;
	}
}
if(keyCounterDelayX == 0){
	keyCounterDelayX = timerStart;
}
//____
var _newY = lerp(_viewY, _gotoY, 0.1);

global.cameraX = _newX;
global.cameraY = _newY;

//keyCounter Text Vertical Movement
if(keyCounterDelayY > 0){
	var counterY = lerp(_viewY, _gotoY, 0.01);
	cameraY = counterY;
}

if(_ver != 0){
	var counterY = lerp(_viewY, _gotoY, 0.1);
	cameraY = counterY;
	if((keyCounterDelayY > 0) && (keyCounterDelayY == timerStart)){
		keyCounterDelayY--;
	}
}
if (keyCounterDelayY < timerStart){
	var counterY = lerp(_viewY, _gotoY, 0.1);
	cameraY = counterY;
	if(keyCounterDelayY != timerMin){
		keyCounterDelayY--;
	}
}
if(keyCounterDelayY == 0){
	keyCounterDelayY = timerStart;
}
//____
var _endX = lerp(_viewX, 0, 0.02);
var _endY = lerp(_viewY, 0, 0.02);
var _endWidth = lerp(_viewW, room_width, 0.02);
var _endHeight = lerp(_viewH, room_height, 0.02);

if(endgame_collision == false){
	camera_set_view_pos(view_camera[0], _newX, _newY);
	camera_set_view_size(view_camera[0], 513, 288);
}else{
	camera_set_view_pos(view_camera[0], _endX, _endY);
	camera_set_view_size(view_camera[0], _endWidth, _endHeight);
	global.ambientShadowIntensity = 0.85;
}

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

//____________
//Animation
if((place_meeting(x+hsp, y, obj_testWall)) || (place_meeting(x+hsp, y, obj_testWall))){
	sprite_index = CharStandingAnim;
	image_speed = 1;
}
else{
	if(hsp == 0 && vsp == 0){
		sprite_index = CharStandingAnim;
	}
	else{
		sprite_index = CharWalkingAnim;
	}
}

if(hsp != 0){image_xscale = sign(hsp)}