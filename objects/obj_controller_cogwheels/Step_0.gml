/// @description Run each wheel's step event in the correct order to keep the last dragged wheel at the top

// Loop from last to first instance in the list
for (var i = ds_list_size(layerList) - 1; i >= 0; i--) {
    with (ds_list_find_value(layerList, i)) {
        depth = baseLayer - i;
		runStep();
    }
}