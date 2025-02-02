repeat (radius) {
	var _random_radius = sqrt(random(1)) * radius;
	var _random_angle = random(360);
	part_particles_create(
		obj_particle_setup.particle_system,
		x + lengthdir_x(_random_radius, _random_angle),
		y + lengthdir_y(_random_radius, _random_angle),
		particles,
		1
	);
}

var _init = angles[0] + rotation + 360 / 10;

for (var i = 0; i < 360; i += 360 / 5) {
	//pt_shard
	var _shard = obj_particle_setup.pt_shard;
	var _scale = radius / 50 / 4;
	part_type_scale(_shard, _scale, _scale);
	var _dir = _init + i;
	part_type_direction(_shard, _dir, _dir, 0, 0);

	var nGradientX = lengthdir_x(1, _dir - lightDir);
	var nGradientY = lengthdir_y(1, _dir - lightDir);
	var gradient = 0.5 + abs(nGradientX) / 2;
	var gradientX = 0.5 * (1 + nGradientX);
	var gradientY = 0.5 * (1 + nGradientY);
	var _color = merge_color(
		color_front,
		nGradientX > 0 ? color_up : color_down,
		abs(nGradientX)
	);
	_color = merge_color(
		_color,
		nGradientY > 0 ? color_right : color_left,
		abs(nGradientY)
	);
	part_type_colour1(_shard, _color);
	part_particles_create(obj_particle_setup.particle_system, x, y, _shard, 1);
}

if (instance_exists(summoner_original)) {
	for (var i = 0; i < array_length(summoner_original.summons); i++) {
		if (summoner_original.summons[i] == id) {
			array_delete(summoner_original.summons, i, 1);
			break;
		}
	}
}

if (instance_exists(tracker)) {
	instance_destroy(tracker);
}
