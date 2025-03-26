/// @description Move claw left

change_controls_sprite(spr_puzzle_claw_controls_left);

if (x > boundary.x + vMax) {
	x -= vMax;
} else {
	x = boundary.x;
}