// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keyCounterFont(){
	//draw_set_alpha(1);

	switch(keyCounterColor){
		case "green":
			draw_set_color(c_lime);
			break;
		case "yellow":
			draw_set_color(c_yellow);
			break;
		case "red":
			draw_set_color(c_red);
			break;
		case "blue":
			draw_set_color(c_aqua);
			break;
		case "orange":
			draw_set_color(c_orange);
			break;
		default:
			draw_set_color(c_white);
	}

	draw_set_font(fnt_keyCounter);
}