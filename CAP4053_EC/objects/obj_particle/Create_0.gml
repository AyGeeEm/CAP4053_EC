if (!variable_instance_exists(id, "part_emitter")) {
    part_emitter = part_emitter_create(global.partSystem);
    part_type = part_type_create();
    
    part_emitter_region(global.partSystem, part_emitter, 0, 4268, 0, 2304, ps_shape_rectangle, ps_distr_linear);
    part_emitter_stream(global.partSystem, part_emitter, part_type, 8);
    
    part_type_alpha3(part_type, 0, 1, 0);
    part_type_color3(part_type, c_white, c_ltgray, c_gray);
    part_type_life(part_type, game_get_speed(gamespeed_fps) * 2, game_get_speed(gamespeed_fps) * 2.5);
    part_type_scale(part_type, 1, 1);
    part_type_gravity(part_type, 0.01, 180);
}
