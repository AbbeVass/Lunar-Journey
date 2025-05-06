/// @description Stop animation

if (image_index == 3 && image_speed > 0) {
	image_speed = 0;
	obj_player.bubbleContent = instance_create_depth(x+content_x_diff, y-content_y_diff, -101, obj_key);
	obj_player.bubbleContent.image_xscale = 0.2;
	obj_player.bubbleContent.image_yscale = 0.2;
	obj_player.bubbleContent.image_blend = c_ltgrey;
}