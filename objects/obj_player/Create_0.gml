/// @description Variables

vMax = 6;
vx = 0;
acc = 0.5;

enum state {
	STANDING,
	WALKING
}
animationState = state.STANDING;

enum enter_cave {
	NONE,
	START,
	GATE_FADEOUT,
	WALK_IN_POSITION,
	WALK_INSIDE,
	ROOM_FADEOUT,
	FALL_DOWN
}
seqState = enter_cave.NONE;

path = pth_player_forest;

switch (room) {
	case rm_forest:
		seqState = enter_cave.NONE;
		path = pth_player_forest;
	break;
	case rm_cave:
		path = pth_player_cave;
	break;
}

// The players position on the path is a value between 0 and 1
pathPosition =	(x - path_get_point_x(path, 0)) /
				(path_get_point_x(path, path_get_number(path)-1) - path_get_point_x(path, 0));
				
// FIXME
if (room == rm_cave) {
	pathPosition =	sqrt(power((x - path_get_point_x(path, 0)), 2) + power(550 - path_get_point_y(path, 0), 2)) /
					(path_get_length(path));
}

inventory = [];
bubble = noone;
bubbleContent = noone;
item = noone;
