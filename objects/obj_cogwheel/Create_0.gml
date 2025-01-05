/// @description Variables and methods

startWheel = false;
spinning = false;
rotationSpeed = 1;

dragged = false;
offset_x = 0;
offset_y = 0;

functionRunning = false;

/**
 * Check if this cogwheel is connected to a start wheel
 * @returns {bool} is connected to a start wheel
 */
function isConnectedToStart() {
    
    // Prevent a loop where 2 cogwheel objects call this funciton at each other
	if (functionRunning) {
		return false;
	} else {
		functionRunning = true;
	}
	
    // Get a list of all touching wheels
	var collisionList = ds_list_create();
	var numCollision = collision_circle_list(x, y, radius*image_xscale, obj_cogwheel, true, true, collisionList, true);
	
    // Loop through the list and use recursion to check if any wheel with a conneciton is a start wheel
	for (var i = 0; i < numCollision; i++) {
		var wheel = ds_list_find_value(collisionList, i);
		if (wheel.startWheel || (!wheel.dragged && wheel.isConnectedToStart())) {
			
            // Set this wheel's rotation to the opposit of the closest wheel with a connection to a start wheel
            rotationSpeed = -wheel.rotationSpeed;
            
            // Garbage collection
			ds_list_destroy(collisionList);
			functionRunning = false;
			return true;
		}
	}
	
    // Garbage collection
	ds_list_destroy(collisionList);
	functionRunning = false;
	return false;
}