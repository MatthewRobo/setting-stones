if (instance_exists(summoner)) {
	var _xTarget = summoner.x;
	var _yTarget = summoner.y;
	var _x = x;
	var _y = y;

	if (use_start) {
		_x = x_start;
		_y = y_start;
		_xTarget = x;
		_yTarget = y;
	}

	var _xOrigin = _x;
	var _yOrigin = _y;

	if (clouds == -1) {
		clouds = floor(point_distance(_xOrigin, _yOrigin, _xTarget, _yTarget) / 20);
	}

	part_type_colour2(obj_particle_setup.ptype_trackerdust, color_point, color_base);
	var _scale = 1;
	if (instance_exists(mine)) {
		_scale = mine.radius / 100;
	}

	var _dir = point_direction(_xOrigin, _yOrigin, _xTarget, _yTarget);

	//part_type_direction(obj_particle_setup.ptype_trackerdust, _dir, _dir, 0, 0);

	for (var i = 0; i < clouds; i++) {
		var _lifetime = lerp(0, lifetime, i / clouds);
		var _size = _scale * (_lifetime / lifetime) + 1;
		part_type_life(obj_particle_setup.ptype_trackerdust, _lifetime, _lifetime);
		part_type_size(obj_particle_setup.ptype_trackerdust, _size, _size, 0, 0);
		var _length =
			point_distance(_xOrigin, _yOrigin, _xTarget, _yTarget) / (clouds - 1);
		part_particles_create(
			obj_particle_setup.particle_system,
			_x,
			_y,
			obj_particle_setup.ptype_trackerdust,
			1
		);
		_x += lengthdir_x(_length, _dir);
		_y += lengthdir_y(_length, _dir);
	}
}
