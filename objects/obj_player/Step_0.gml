/// @description Player movement

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
x += vx;

var path_start_x = path_get_point_x(path, 0);
var path_end_x = path_start_x + path_get_length(path);
	
// Prevent the player from walking beyond the path
if (x < path_start_x) {
	x = path_start_x;
} else if (x > path_end_x) {
	x = path_end_x;
}
	
// Follow the path
y = path_get_y(path, (x - path_start_x) / path_get_length(path));
