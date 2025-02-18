/// @description Show speach bubble or open gate

if (array_contains(inventory, "cave_key")) {
	seqState = enter_cave.START;
	array_pop(inventory);
	instance_destroy(obj_speachbubble);
	instance_destroy(obj_key);
	item = noone;
} else if (seqState = enter_cave.NONE) {
	
	// Spawn the mushroom guy
	if (!instance_exists(obj_character_mushroom)) {
		var mushroom = instance_create_layer(8440, 953.7, "characters", obj_character_mushroom);
		mushroom.image_xscale = 0.3;
		mushroom.image_yscale = 0.3;
	}
	
	// Thinking about the key
	if (!instance_exists(obj_speachbubble)) {
		bubble = instance_create_depth(x - 100, y - sprite_height - 150, -100, obj_speachbubble);
		bubble.image_xscale = 0.2;
		bubble.image_yscale = 0.2;
		
		bubbleContent = instance_create_depth(bubble.x, bubble.y, -101, obj_key);
		bubbleContent.image_xscale = 0.2;
		bubbleContent.image_yscale = 0.2;
	} else {
		
		// Follow the player
		bubble.x = x - 100;
		bubble.y = y - sprite_height - 150;
		bubbleContent.x = bubble.x;
		bubbleContent.y = bubble.y;
	}
}