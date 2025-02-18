/// @description Give the player the key

instance_destroy(bubble);

// Spawn the key over the player
obj_player.inventory = ["cave_key"];
obj_player.item = instance_create_layer(obj_player.x - 100, obj_player.y - obj_player.sprite_height - 50, "characters", obj_key);
obj_player.item.image_xscale = 0.2;
obj_player.item.image_yscale = 0.2;