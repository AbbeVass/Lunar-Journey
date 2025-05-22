/// @description Show speach bubble or open gate

if (array_contains(inventory, "cave_key")) {
	seqState = enter_cave.START;
	array_pop(inventory);
	instance_destroy(obj_speachbubble);
	instance_destroy(obj_key);
	item = noone;
} else if (seqState = enter_cave.NONE) {
	
	// Thinking about the key
	if (!instance_exists(obj_speachbubble)) {
		bubble = instance_create_depth(x, y - sprite_height, -100, obj_speachbubble);
		bubble.content = content_type.KEY;
		
	} else {

		// Follow the player
		bubble.x = x;
		bubble.y = y - sprite_height;
		if (bubbleContent) {
			bubbleContent.x = bubble.x + obj_speachbubble.content_x_diff;
			bubbleContent.y = bubble.y + obj_speachbubble.content_y_diff;
		}
	}
}