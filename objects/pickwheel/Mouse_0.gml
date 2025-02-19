/// @description Create a small cogwheel

if (!global.draggingWheel) {
	var gear = instance_create_layer(mouse_x, mouse_y, "cogwheels", Object15);
	gear.image_xscale = 0.1;
	gear.image_yscale = 0.1;
	gear.dragged = true;
	image_alpha = 0.7;
	global.draggingWheel = true;
}