/// @description Start spinning if connected to a start wheel

if (isConnectedToStart()) {
	spinning = true;
	
	// Puzzle is completed
	if (endWheel) {
		if (!instance_exists(obj_fade)) {
			instance_create_depth(0, 0, -9999, obj_fade);
		}
	}
}