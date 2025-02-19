/// @description Variables and methods

#macro draggedAlpha 0.7

startWheel = false;
endWheel = false;
spinning = false;
rotationSpeed = 1;
snapRadius = 10;

dragged = false;
offset_x = 0;
offset_y = 0;

functionRunning = false;

image_xscale = scale;
image_yscale = scale;

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

/**
 * Run the wheel's step event manualy
 */
function runStep() {
	if (spinning) {
		image_angle += rotationSpeed;
	}

	// Start dragging if not a start wheel and no other wheel is dragged
	if (mouse_check_button_pressed(mb_left) and !startWheel and !endWheel) {
	    if (!global.draggingWheel && position_meeting(mouse_x, mouse_y, id)) {
			global.draggingWheel = true;
	        dragged = true;
			spinning = false;
	        offset_x = x - mouse_x;
	        offset_y = y - mouse_y;
			image_alpha = 0.7;
			obj_controller_machine.addInstanceOnTop(id);
	    } else {
		
			// Wait to make sure the dragged wheel has been picked up
			alarm_set(0, 1);
		}
	}

	// Stop dragging
	if (mouse_check_button_released(mb_left) and !startWheel and !endWheel) {
		if (dragged) {
			global.draggingWheel = false;
		    dragged = false;
			var peg = collision_circle(x, y, snapRadius, obj_peg, false, true);
			if (peg) {
				x = peg.x;
				y = peg.y;
			} else {
				instance_destroy(id);
			}
			
			image_alpha = 1;
			depth = 1;
		}
	
		// Wait to make sure the dragged wheel has been released
		alarm_set(1, 1);
	}

	// If the wheel is dragged, follow the cursors position
	if (dragged) {
	    x = mouse_x + offset_x;
	    y = mouse_y + offset_y;
	}
}

// Make sure everything is loaded before adding the wheel to the layer list
alarm_set(2, 1);