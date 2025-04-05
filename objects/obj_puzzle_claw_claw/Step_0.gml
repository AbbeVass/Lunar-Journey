/// @description Control the claw

switch (control_state) {
    
    // Controlling
    case claw_state.DEFAULT:
		if (y < startY) {
			change_controls_sprite(spr_puzzle_claw_controls_down);
			y += vMax;
		} else if (y != startY) {
			y = startY;
		} else {
			if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
				// Move claw right
				change_controls_sprite(spr_puzzle_claw_controls_right);
			
				// Stay inside the boundary
				// Sprite height becomes its width because the claw is rotated 90 deg
				if (x < boundary.x + boundary.sprite_width - sprite_height/2 - vMax) {
					x += vMax;
				} else {
					x = boundary.x + boundary.sprite_width - sprite_height/2;
				}
			} else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
				// Move claw left
				change_controls_sprite(spr_puzzle_claw_controls_left);
			
				// Stay inside the boundary
				// Sprite height becomes its width because the claw is rotated 90 deg
				if (x > boundary.x + sprite_height/2 + vMax) {
					x -= vMax;
				} else {
					x = boundary.x + sprite_height/2;
				}
			} else {
				// Stationary
				change_controls_sprite(spr_puzzle_claw_controls_default);
			}
		
			// Go down to grab a ball
	        if (keyboard_check_pressed(vk_space)) {
	            control_state = claw_state.GO_DOWN;
	        }
		}
    break;
    
    // Going down
    case claw_state.GO_DOWN:
		change_controls_sprite(spr_puzzle_claw_controls_down);
        y += vMax;
		
		// Grab a ball if it's in the middle of the claw, between -3 px and +3 px
        picked_ball = collision_line(x-3, y+sense_distance, x+3, y+sense_distance, obj_puzzle_claw_ball_par, true, true);
        if (picked_ball) {
            if (collision_line(x-ball_radius, y+sense_distance-vMax, x+ball_radius, y+sense_distance-vMax, obj_puzzle_claw_ball_par, true, true)) {
                control_state = claw_state.GO_UP;
                picked_ball = noone;
            }
            else {
                control_state = claw_state.GRAB;
            }
        } else if (collision_point(x, y, obj_puzzle_claw_wall, false, true)) {
			control_state = claw_state.GO_UP;
		}
    break;
    
    // Grabing ball
    case claw_state.GRAB:
        if (!collision_line(x-3, y, x+3, y, picked_ball, false, true)) {
            y += vMax;
        }
        else {
            picked_ball.phy_active = false;
            picked_ball.phy_position_x = x;
			sprite_index = spr_puzzle_claw_claw_closed;
            control_state = claw_state.GO_UP;
        }
    break;
    
    // Going up
    case claw_state.GO_UP:
		change_controls_sprite(spr_puzzle_claw_controls_up);
        y -= vMax;
        if (picked_ball) {
            picked_ball.phy_position_y = y+24;
			if (y <= releaseY) {
				if (picked_ball.object_index == obj_puzzle_claw_ball_shard) {
					if (!instance_exists(obj_fade)) {
						instance_create_depth(0, 0, -9999, obj_fade);
					}
				}
	            instance_destroy(picked_ball);
				sprite_index = spr_puzzle_claw_claw_open;
	            control_state = claw_state.DEFAULT;
	        }
        } else if (y <= startY) {
			y = startY;
			control_state = claw_state.DEFAULT;
		}
        
        
    break;
}