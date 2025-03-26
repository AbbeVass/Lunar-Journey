/// @description Move claw right

change_controls_sprite(spr_puzzle_claw_controls_right);

// Sprite height becomes its width because the claw is rotated 90 deg
if (x < boundary.x + boundary.sprite_width - sprite_height - vMax) {
	x += vMax;
} else {
	x = boundary.x + boundary.sprite_width - sprite_height;
}