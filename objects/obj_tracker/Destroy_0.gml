if (instance_exists(summoner)) {
	if (clouds == -1) {
		clouds = floor(point_distance(x, y, summoner.x, summoner.y) / 20);
	}

	var _xTarget = use_start ? x_start : summoner.x;
	var _yTarget = use_start ? y_start : summoner.y;
	var _x = x;
	var _y = y;
	for (var i = 0; i < clouds; i++) {
		var _length = point_distance(x, y, _xTarget, _yTarget) / (clouds - 1);
		var _dir = point_direction(x, y, _xTarget, _yTarget);
		part_particles_create(
			obj_particle_setup.particle_system,
			_x,
			_y,
			obj_particle_setup.particle_steam,
			1
		);
		_x += lengthdir_x(_length, _dir);
		_y += lengthdir_y(_length, _dir);
	}
}
