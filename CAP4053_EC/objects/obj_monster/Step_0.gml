// Update the FSM
switch (currentState) {
    case states.ROAMING:
        //Check if player is within 200 coordinate points distance
        if (point_distance(x, y, obj_player.x, obj_player.y) <= 100 && currentState != states.CHASING) {
            currentState = states.WAITING;
            alarm[0] = room_speed/2; //Set alarm for 1 second
        } else {
			//alarm[2] = room_speed;
			//path_start(path, moveSpeed, path_action_stop, false);
			if (!path_exists(path) || path_position == 1) {
				if (mp_grid_path(global.grid, path, x, y, irandom_range(0, room_width), irandom_range(0, room_height), true)) {
					path_start(path, moveSpeed, path_action_stop, false);
				}
			}
        }
        break;
        
    case states.CHASING:
        // Chase the player using A* pathfinding
        if (mp_grid_path(global.grid, path, x, y, obj_player.x-16, obj_player.y-16, true)) {
            path_start(path, moveSpeed * 2, path_action_stop, false);
        }
		if (point_distance(x, y, obj_player.x, obj_player.y) >= 300) {
            currentState = states.ROAMING;
        }
		
        break;
        
    case states.WAITING:
        // Stop moving and wait for 1 second
		sprite_index = alert_anim;
        path_end();
        break;
}

//Update moving sprite according to direction
var dir = direction;

if (dir >= 45 && dir < 135) {
	//Moving up
}
else if (dir >= 135 && dir < 225) {
	if (currentState == states.ROAMING) {
		image_speed = 0.5;
		sprite_index = walking_anim;
	}
	else if (currentState == states.CHASING) {
		image_speed = 1.5;
		sprite_index = running_anim;
	}
	image_xscale = 1;
}
else if (dir >= 225 && dir < 315) {
	//Moving down
}
else {
	if (currentState == states.ROAMING) {
		image_speed = 0.5;
		sprite_index = walking_anim;
	}
	else if (currentState == states.CHASING) {
		image_speed = 1.5;
		sprite_index = running_anim;
	}
	image_xscale = -1;
}

//Endgame
if (global.dead && alarm[2] == -1) {
	//Run death animation
	alarm[2] = room_speed*5;
}