/// @description Insert description here

vMax = 10;
boundary = instance_find(obj_puzzle_claw_boundary, 0);

ctrl_layer_id = layer_get_id("controls");

function change_controls_sprite(spr) {
	
	// Get the first element in the layer for the controls sprite
	var element = layer_get_all_elements(ctrl_layer_id)[0];
	if (layer_sprite_get_sprite(element) != spr) {
		layer_sprite_destroy(element)
		layer_sprite_create(ctrl_layer_id, 0, 0, spr);
	}
}