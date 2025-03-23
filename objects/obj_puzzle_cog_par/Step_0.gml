/// @description Drag and control each wheel

if (spinning) {
	image_angle += rotationSpeed;
}

// Start dragging if not a start wheel and no other wheel is dragged
if (mouse_check_button_pressed(mb_left) && !startWheel) {
	if (!global.draggingWheel && !endWheel && position_meeting(mouse_x, mouse_y, id)) {
		global.draggingWheel = true;
	    dragged = true;
		spinning = false;
	    offset_x = x - mouse_x;
	    offset_y = y - mouse_y;
		image_alpha = 0.7;
	} else {
		
		// Wait to make sure the dragged wheel has been picked up
		alarm_set(0, 1);
	}
}

// Stop dragging
if (mouse_check_button_released(mb_left) && !startWheel) {
	if (!endWheel && dragged) {
		dragged = false;
		global.draggingWheel = false;
		var peg = collision_circle(x, y, snapRadius, obj_puzzle_cog_peg, false, true);
		if (peg) {
			x = peg.x;
			y = peg.y;
			if (collision_circle(x, y, radius-tipLength, obj_puzzle_cog_par, true, true)) {
				instance_destroy(id);
			}
		} else {
			instance_destroy(id);
		}
			
		image_alpha = 1;
		depth = 1;
	}
	
	// Wait to make sure the dragged wheel has been released
	// before checking if the puzzle is finished
	alarm_set(1, 1);
}

// If the wheel is dragged, follow the cursors position
if (dragged) {
	x = mouse_x + offset_x;
	y = mouse_y + offset_y;
}