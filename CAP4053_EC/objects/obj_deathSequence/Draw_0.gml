if (global.dead) {
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	if (alarm[0] == -1) {
		alarm[0] = room_speed;
	}
	
	if (part2) {
		draw_set_color(c_white);
		draw_text(global.cameraX + 215, global.cameraY + 130, "You died.");
	
		if (alarm[1] == -1) {
			alarm[1] = room_speed * 2;
		}
	}
	
	if (part3) {
		draw_text(global.cameraX + 210, global.cameraY + 160, "Try again.");
	}
	
}