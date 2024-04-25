//Update path every step
/*if (instance_exists(obj_player)) {
    astar_pathfinding(global.grid, path, x, y, obj_player.x, obj_player.y);
    path_start(path, moveSpeed, path_action_stop, true);
}

// Move the monster along the path
if (path_index >= 0) {
    if (path_position >= 1) {
        path_position = 0;
    }
    var dir = point_direction(x, y, path_get_x(path, path_position), path_get_y(path, path_position));
    x += lengthdir_x(moveSpeed, dir);
    y += lengthdir_y(moveSpeed, dir);
}*/

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 1)){
	path_start(path, 4, path_action_stop, false);
}