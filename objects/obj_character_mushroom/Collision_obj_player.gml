/// @description Insert description here
// You can write your code in this editor

if (bubble == noone) {
	bubble = instance_create_depth(x, y - sprite_height - 150, -100, obj_speachbubble);
	bubble.image_xscale = 0.2;
	bubble.image_yscale = 0.2;
	
	// Create bubble content
	
	alarm_set(0, 300);
}