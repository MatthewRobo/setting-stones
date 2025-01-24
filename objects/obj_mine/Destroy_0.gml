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
