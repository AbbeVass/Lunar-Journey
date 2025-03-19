/// @description Set up the list for all cogwheels and create the start wheel

layerList = ds_list_create();
#macro baseLayer -100

/**
 * Add or move a instance to the top of all other instances in the layer list for the machine
 * @param {Id.Instance} instId
 */
function addInstanceOnTop(instId) {
	var index = ds_list_find_index(layerList, instId);
	if (index != -1) {
		ds_list_delete(layerList, index);
	}
	ds_list_add(layerList, instId);
}

startWheelX = 859;
startWheelY = 973;
var startWheel = instance_create_layer(startWheelX, startWheelY, "start_end_wheels", obj_cogwheel_1);

startWheel.startWheel = true;
startWheel.spinning = true;

endWheelX = 1523;
endWheelY = 469;
endtWheel = instance_create_layer(startWheelX, startWheelY, "start_end_wheels", obj_cogwheel_1);

endWheel.endWheel = true;
endWheel.spinning = false;

global.draggingWheel = false;