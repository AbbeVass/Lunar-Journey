/// @description Variables and methods

enum claw_state {
	DEFAULT,
	GO_DOWN,
	GRAB,
	GO_UP
}
control_state = claw_state.DEFAULT;

startY = 205;
y = startY;
vMax = 5;
boundary = instance_find(obj_puzzle_claw_boundary, 0);

picked_ball = noone;

ctrl_layer_id = layer_get_id("controls");

function change_controls_sprite(spr) {
	
	// Get the first element in the layer for the controls sprite
	var element = layer_get_all_elements(ctrl_layer_id)[0];
	if (layer_sprite_get_sprite(element) != spr) {
		layer_sprite_destroy(element)
		layer_sprite_create(ctrl_layer_id, 0, 0, spr);
	}
}