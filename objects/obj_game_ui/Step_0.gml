for (var i = 0; i < array_length(players); i++) {
	var playersExist = true;
	if (instance_exists(players[i])) {
		meters[i] = clamp(players[i].meter, 0, meter_max);
		hps[i] = players[i].hp;
		supercosts[i] = players[i].super_cost;
		hittables[i] = players[i].hittable;
		heats[i] = players[i].heat;
		staminas[i] = players[i].stamina;
	} else {
		hps[i] = 0;
		playersExist = false;
	}

	lerp_meters[i] = lerp(lerp_meters[i], meters[i], lerpfactor_meters);
	lerp_hps[i] = lerp(lerp_hps[i], hps[i], lerpfactor_hps);
	lerp_heats[i] = lerp(lerp_heats[i], heats[i], lerpfactor_heats);
	lerp_staminas[i] = lerp(lerp_staminas[i], staminas[i], lerpfactor_staminas);
}

if (instance_exists(obj_player_1) && instance_exists(obj_player_2)) {
	player_angle = point_direction(
		players[0].x,
		players[0].y,
		players[1].x,
		players[1].y
	);
	midpoint = [mean(players[0].x, players[1].x), mean(players[0].y, players[1].y)];
	player_distance = point_distance(players[0].x, players[0].y, players[1].x, players[1].y);

	if (
		rectangle_in_rectangle(
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * health_bar_offset_x,
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * health_bar_offset_y,
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (health_bar_offset_x + 0.4),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * (health_bar_offset_y + 0.07),
			obj_player_1.x - 100,
			obj_player_1.y - 100,
			obj_player_1.x + 100,
			obj_player_1.y + 100
		)
		|| rectangle_in_rectangle(
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * health_bar_offset_x,
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * health_bar_offset_y,
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (health_bar_offset_x + 0.4),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * (health_bar_offset_y + 0.07),
			obj_player_2.x - 100,
			obj_player_2.y - 100,
			obj_player_2.x + 100,
			obj_player_2.y + 100
		)
	) {
		alpha[0] = lerp(alpha[0], 0.2, 0.05);
	} else {
		alpha[0] = lerp(alpha[0], 1, 0.05);
	}

	if (
		rectangle_in_rectangle(
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (1 - health_bar_offset_x),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * health_bar_offset_y,
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (1 - (health_bar_offset_x + 0.4)),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * (health_bar_offset_y + 0.07),
			obj_player_1.x - 100,
			obj_player_1.y - 100,
			obj_player_1.x + 100,
			obj_player_1.y + 100
		)
		|| rectangle_in_rectangle(
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (1 - health_bar_offset_x),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * health_bar_offset_y,
			obj_cam_ctrl.cam_x + obj_cam_ctrl.cam_wid * (1 - (health_bar_offset_x + 0.4)),
			obj_cam_ctrl.cam_y + obj_cam_ctrl.cam_hei * (health_bar_offset_y + 0.07),
			obj_player_2.x - 100,
			obj_player_2.y - 100,
			obj_player_2.x + 100,
			obj_player_2.y + 100
		)
	) {
		alpha[1] = lerp(alpha[1], 0.2, 0.05);
	} else {
		alpha[1] = lerp(alpha[1], 1, 0.05);
	}
}
