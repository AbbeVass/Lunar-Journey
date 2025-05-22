/// @description Insert description here
// You can write your code in this editor

if (bubble == noone) {
	bubble = instance_create_depth(x, y - sprite_height, -100, obj_speachbubble);
	bubble.content = content_type.RUNES;
	
	// Create bubble content
	alarm_set(0, 300);
}