/// @description Insert description here
// You can write your code in this editor

if (spinning) {
	image_angle++;
}

// Kolla om vänster musknapp trycks ner över objektet
if (mouse_check_button_pressed(mb_left) and !start_wheel) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        dragged = true;
		spinning = false;
        offset_x = x - mouse_x;
        offset_y = y - mouse_y;
		image_alpha = 0.7;
    }
}

// Kolla om vänster musknapp släpps
if (mouse_check_button_released(mb_left)) {
    dragged = false;
	image_alpha = 1;
	var wheelCollision = collision_circle(x, y, sprite_width/2+20, obj_cogwheel, true, true);
	if (wheelCollision) {
		spinning = true;
	}
}

// Om objektet är draget, följ musens position
if (dragged) {
    x = mouse_x + offset_x;
    y = mouse_y + offset_y;
}
