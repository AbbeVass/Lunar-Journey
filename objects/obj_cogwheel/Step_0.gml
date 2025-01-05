/// @description Drag and update the wheel

if (spinning) {
	image_angle += rotationSpeed;
}

// Kolla om vänster musknapp trycks ner över objektet
if (mouse_check_button_pressed(mb_left) and !startWheel) {
    if (position_meeting(mouse_x, mouse_y, id)) {
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

// If mouse button is released
if (mouse_check_button_released(mb_left) and !startWheel) {
    dragged = false;
	image_alpha = 1;
	
	// Wait to make sure the dragged wheel has been released
	alarm_set(1, 1);
}

// If the wheel is dragged, follow the cursors position
if (dragged) {
    x = mouse_x + offset_x;
    y = mouse_y + offset_y;
}
