/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 28F0C9E8
/// @DnDArgument : "code" "if(obj_player.endgame_collision == true){$(13_10)	if(timer != timerMax){$(13_10)		timer++;$(13_10)	}else{$(13_10)		fadeout = true;$(13_10)	//alarm[0] = 2 * room_speed;$(13_10)	}$(13_10)}$(13_10)$(13_10)if(fadeout == true){$(13_10)	if alpha > 0{$(13_10)		alpha -= 1/fadeTime; // alpha will reach 1 at set fade time$(13_10)		if alpha <= 0 {$(13_10)			instance_destroy();$(13_10)			game_end();$(13_10)		}$(13_10)	}$(13_10)}"
if(obj_player.endgame_collision == true){
	if(timer != timerMax){
		timer++;
	}else{
		fadeout = true;
	//alarm[0] = 2 * room_speed;
	}
}

if(fadeout == true){
	if alpha > 0{
		alpha -= 1/fadeTime; // alpha will reach 1 at set fade time
		if alpha <= 0 {
			instance_destroy();
			game_end();
		}
	}
}