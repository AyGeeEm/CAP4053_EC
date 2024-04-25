if(place_meeting(x, y, obj_player) && !collected){
	obj_player.keys++;
	obj_player.keysLeft--;
	image_index = 0;
	collected = true;
}

if(collected == true){
	sprite_index = keySpriteObtained;
	if(image_index > image_number - 1){
		instance_destroy(id);
	}
}

if(obj_player.keysLeft == 0){
	sprite_index = keySpriteObtained;
	if(image_index > image_number - 1){
		instance_destroy();
	}
}