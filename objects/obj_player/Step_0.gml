/// @description Player movement


if (global.playerControl) {
	
	// Accelerate player right
	if (keyboard_check(vk_right)) {
		if (vx < vMax) {
			vx += acc;
		}
	}
	
	// Accelerate player left
	else if (keyboard_check(vk_left)) {
		if (vx > -vMax) {
			vx -= acc;
		}
	}

	// Stop player movement
	else if (vx != 0) {

		// Make sure the deacceleration doesn't overshoot 0
		if (vx > -acc && vx < acc) {
			vx = 0;
		}
	
		// Change the speed towords 0
		else if (vx > 0) { vx -= acc; }
		else if (vx < 0) { vx += acc; }
	}

	// Move the player
	pathPosition += vx / path_get_length(path);
	
	// Prevent the player from walking beyond the path
	if (pathPosition < 0) {
		pathPosition = 0;
	} else if (pathPosition > 1) {
		pathPosition = 1;
	}
	
	// Follow the path
	y = path_get_y(path, pathPosition);
	x = path_get_x(path, pathPosition);
}

// FIXME
// Remove the bubble at the gate
if (x > 1600 && x < 1700 && instance_exists(obj_speachbubble)) {
	instance_destroy(bubble);
	instance_destroy(bubbleContent);
}

// Make the key follow the player
if (item != noone) {
	item.x = x;
	item.y = y - sprite_height - 50;
}


switch (seqState) {
	case enter_cave.START:
		global.playerControl = false;
		seqState = enter_cave.GATE_FADEOUT;
	break;
	
	// Fade out the gate
	case enter_cave.GATE_FADEOUT:
		obj_forest_cave_gate.image_alpha -= 0.015;
		if (obj_forest_cave_gate.image_alpha <= 0) {
			instance_destroy(obj_forest_cave_gate);
			seqState = enter_cave.WALK_IN_POSITION;
		}
	break;
	
	// Move the player in front of the cave
	case enter_cave.WALK_IN_POSITION:
		x -= 3; 
		y += 1;
		//1140,940
		if (x <= 1140 && y >= 940) {
			seqState = enter_cave.WALK_INSIDE;
		}
	break;
	
	// Fade away the player into the cave
	case enter_cave.WALK_INSIDE:
		image_alpha -= 0.01;
		image_xscale *= 0.99;
		image_yscale *= 0.99;
		y -= image_xscale * 3;
		if (image_alpha <= 0) {
			seqState = enter_cave.NONE;
			instance_create_depth(0, 0, -9999, obj_fade);
		}
	break;
	
	case enter_cave.FALL_DOWN:
		if (y < path_get_y(path, pathPosition)) {
			y += 20;
		} else {
			y = path_get_y(path, pathPosition);
			seqState = enter_cave.NONE;
			global.playerControl = true;
		}
	break;
}