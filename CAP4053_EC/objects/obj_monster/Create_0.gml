event_inherited();
polygon = polygon_from_instance(id);

path = path_add();
moveSpeed = 2;
valid_path = false;

randomize();

//mp_grid_path(global.grid, path, x, y, irandom_range(0, room_width), irandom_range(0, room_height), true);
//path_start(path, moveSpeed, path_action_stop, false);

while(!valid_path) {
	if (mp_grid_path(global.grid, path, x, y, irandom_range(0, room_width), irandom_range(0, room_height), true)) {
		path_start(path, moveSpeed, path_action_stop, false);
		valid_path = true;
	}
}

//Define FSM states
enum states {
    ROAMING,
    CHASING,
    WAITING
}

//Set initial state
currentState = states.ROAMING;

//Set sprite variables
walking_anim = MonsterWalking;
running_anim = MonsterRunning;
alert_anim = MonsterAlert;
image_speed = 0.5;

//Endgame variable
restart = false;