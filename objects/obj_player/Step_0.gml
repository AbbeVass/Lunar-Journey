/// @description Insert description here

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