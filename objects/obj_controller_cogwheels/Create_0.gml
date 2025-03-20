/// @description Set up the list for all cogwheels and create the start wheel

startWheelX = 859;
startWheelY = 973;
with (instance_create_layer(startWheelX, startWheelY, "start_end_wheels", obj_cogwheel_1)) {
	depth = 600;
	startWheel = true;
	spinning = true;
}

endWheelX = 1523;
endWheelY = 469;
with (instance_create_layer(endWheelX, endWheelY, "start_end_wheels", obj_cogwheel_1)) {
	depth = 601;
	endWheel = true;
	spinning = false;
}

global.draggingWheel = false;