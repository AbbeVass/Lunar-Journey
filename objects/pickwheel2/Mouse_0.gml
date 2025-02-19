/// @description Create a big wheel

if (!global.draggingWheel) {
	var gear = instance_create_layer(mouse_x, mouse_y, "cogwheels", Object14);
	gear.image_xscale = 0.15;
	gear.image_yscale = 0.15;
	gear.dragged = true;
	image_alpha = 0.7;
	global.draggingWheel = true;
}
