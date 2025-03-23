/// @description Create a small cogwheel

if (!global.draggingWheel) {
	with (instance_create_layer(mouse_x, mouse_y, "cogwheels", obj_puzzle_cog_1)) {
		dragged = true;
		image_alpha = 0.7;
	}
	global.draggingWheel = true;
}