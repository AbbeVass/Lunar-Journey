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

startWheelX = 1024;
startWheelY = 320;
var startWheel = instance_create_layer(startWheelX, startWheelY, "cogwheels", obj_cogwheel);

startWheel.startWheel = true;
startWheel.spinning = true;

global.draggingWheel = false;