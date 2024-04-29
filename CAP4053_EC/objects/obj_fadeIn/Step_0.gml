if alpha < 1{
	fadeTime = 3*room_speed;
	alpha += 1/fadeTime; // alpha will reach 1 at set fade time
	if alpha >= 1 {
		instance_destroy();
		instance_create_layer(64,64,"Lighting",obj_fadeOut);
	}
}