randomize();

if (!variable_global_exists("global.partSystem")) {
    global.partSystem = part_system_create();
    part_system_depth(global.partSystem, 100);
}