/// @desc Move Main Light with Player or with arrow keys

/*var light_hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var light_ver = keyboard_check(vk_down) - keyboard_check(vk_up);

var light_viewX = camera_get_view_x(view_camera[0]);
var light_viewY = camera_get_view_y(view_camera[0])

var light_viewW = camera_get_view_width(view_camera[0]);
var light_viewH = camera_get_view_height(view_camera[0]);

var light_gotoX = x + (light_hor * 150) - (light_viewW * 0.5);
var light_gotoY = y + (light_ver * 100) - (light_viewH * 0.5);

var light_newX = lerp(light_viewX, light_gotoX, 0.1);
var light_newY = lerp(light_viewY, light_gotoY, 0.1);*/

/*if (!keyboard_check(vk_right) && !keyboard_check(vk_left) && !keyboard_check(vk_up) && !keyboard_check(vk_down)){
	light[| eLight.X] = obj_player.x;
	light[| eLight.Y] = obj_player.y;
}*/

/*else {
	var light_newX = camera_get_view_x(view_camera[0]);
	var light_newY = camera_get_view_y(view_camera[0]);
	//light[| eLight.X] = light_newX;
	//light[| eLight.Y] = light_newY;
}*/

/*else if (keyboard_check(vk_left)) {
	light[| eLight.X] = obj_player.x - 250;
	light[| eLight.Y] = obj_player.y;
}
else if (keyboard_check(vk_right)) {
	light[| eLight.X] = obj_player.x + 250;
	light[| eLight.Y] = obj_player.y;
}
else if (keyboard_check(vk_up)) {
	light[| eLight.X] = obj_player.x;
	light[| eLight.Y] = obj_player.y - 150;
}
else if (keyboard_check(vk_down)) {
	light[| eLight.X] = obj_player.x;
	light[| eLight.Y] = obj_player.y + 150;
}*/

light[| eLight.X] = obj_player.x;
light[| eLight.Y] = obj_player.y;
//light[| eLight.X] = global.cameraX + (camera_get_view_width(view_camera[0]) / 2);
//light[| eLight.Y] = global.cameraY + (camera_get_view_height(view_camera[0]) / 2);