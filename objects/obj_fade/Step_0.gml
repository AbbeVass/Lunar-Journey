/// @description Fade animaiton

if (fadeIn) {
	image_alpha += fadeSpeed;
	if (image_alpha >= 1) {
		//FIXME
		if (room == rm_cave) {
			room_goto(rm_puzzle_cogwheels);
		} else {
			room_goto_next();
		}
		fadeIn = false;
	}
} else {
	image_alpha -= fadeSpeed;
	if (image_alpha <= 0) {
		instance_destroy(id);
		if (room == rm_cave) {
			obj_player.seqState = enter_cave.FALL_DOWN;
		}
	}
}
