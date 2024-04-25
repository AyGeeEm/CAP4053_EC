//draw_text(playerKeyText_x, playerKeyText_y, string(obj_player.keysLeft) + " Left!");
keyCounterFont();

if(obj_player.endgame_collision == false){
	draw_text(obj_player.cameraX + 50, obj_player.cameraY + 30, string(obj_player.keysLeft) + "/8 Keys Left");
}