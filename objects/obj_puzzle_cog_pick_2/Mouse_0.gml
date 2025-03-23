/// @description Create a big wheel

if (!global.draggingWheel) {
	with (instance_create_layer(mouse_x, mouse_y, "cogwheels", obj_puzzle_cog_2)) {
		dragged = true;
		image_alpha = 0.7;
	}
	global.draggingWheel = true;
}
