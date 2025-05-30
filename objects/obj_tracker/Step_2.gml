if (instance_exists(summoner) && instance_exists(mine)) {
	color_base = summoner.color_slow;
	for (var i = 0; i < min(max_summon, array_length(summoner.summons)); i++) {
		if (mine == summoner.summons_reverse[i]) {
			color = merge_color(color_base, c_black, i / max_summon);
			color_point = color;
			is_super = false;
			break;
		}
	}
	if (is_super) {
		color_base = summoner.color_fast;
		color = color_base;
	}
	//if (summoner.summons[0] == mine && array_length(summoner.summons) == summoner.max_summon) {
	//color = c_white;
	//}

	if (mine.shot) {
		//color = c_orange;
		if (!was_shot) {
			color = c_white;
			color_point = c_white;
			base_alpha = 0.5;
		} else {
			color = merge_color(color, color_base, 0.12);
			color_point = merge_color(color_point, color_base, 0.12);
			base_alpha = lerp(base_alpha, 0.1, 0.12);
		}
		was_shot = true;

	} else if (
		summoner.shooting
		&& point_distance(mine.x, mine.y, summoner.x, summoner.y) > summoner.shoot_radius
	) {
		//color = c_white;
		color = merge_color(
			c_black,
			color_base,
			power(
				summoner.shoot_radius
					/ point_distance(mine.x, mine.y, summoner.x, summoner.y),
				2
			)
		);
	}
	//
	//part_type_colour2(obj_particle_setup.pt_trackerdust, color_base, color_base);
	//var _scale = mine.radius / 23;
	//
	//part_type_life(obj_particle_setup.pt_trackerdust, lifetime, lifetime);
	//part_type_size(obj_particle_setup.pt_trackerdust, _scale, _scale, -_scale/lifetime, 0);
	//part_particles_create(
		//obj_particle_setup.particle_system,
		//x,
		//y,
		//obj_particle_setup.pt_trackerdust,
		//1
	//);
	//part_particles_create(
		//obj_particle_setup.particle_system,
		//mean(x, xprevious),
		//mean(y, yprevious),
		//obj_particle_setup.pt_trackerdust,
		//1
	//);
	
	var _clouds = max(1, floor(point_distance(x, y, xprevious, yprevious) / 16));
	

	part_type_colour2(obj_particle_setup.pt_trackerdust, color_base, color_base);
	var _scale = mine.radius / 30 ;

	var _dir = point_direction(x, y, xprevious, yprevious);

	//part_type_direction(obj_particle_setup.ptype_trackerdust, _dir, _dir, 0, 0);
	var _x = x;
	var _y = y;
	if (point_distance(x, y, xprevious, yprevious) > 0) {
		for (var i = 0; i < _clouds; i++) {
			part_type_life(obj_particle_setup.pt_trackerdust, lifetime, lifetime);
			part_type_size(obj_particle_setup.pt_trackerdust, _scale, _scale, 0, 0);
			var _length =
				point_distance(x, y, xprevious, yprevious) / (_clouds - 1);
			part_particles_create(
				obj_particle_setup.particle_system,
				_x,
				_y,
				obj_particle_setup.pt_trackerdust,
				1
			);
			_x += lengthdir_x(_length, _dir);
			_y += lengthdir_y(_length, _dir);
		}
	}

}

