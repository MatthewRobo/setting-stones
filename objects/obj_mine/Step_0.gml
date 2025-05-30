/// @description Insert description here
// You can write your code in this editor
if (global.hitstop <= 0) {
	hp -= damaged;
	damaged = 0;

	if (hp <= 0) {
		instance_destroy();
	}

	maxspeed = 60 * 50 / radius;
	lifetime++;
	var _particles = 1;
	if (point_distance(0, 0, xspd, yspd > 8)) {
		_particles = 10;
	} else if (point_distance(0, 0, xspd, yspd) > 1) {
		_particles = 2;
	}

	if (active) {
		repeat (_particles) {
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
	}

	x += xspd;
	y += yspd;

	xspd += xaccel;
	yspd += yaccel;

	normalise_speed();

	if (instance_exists(tracker)) {
		tracker.x = x;
		tracker.y = y;
	}

	if (instance_exists(summoner)) {
		rotation = point_direction(x, y, summoner.x, summoner.y);
		//lightDir = point_direction(x,y,summoner.x,summoner.y);
		if (
			!shot
			&& summoner.shooting
			&& distance_to_object(summoner) <= summoner.shoot_radius
			&& abs(distance_to_object(summoner) - summoner.shoot_radius) < 100
			&& state != mine_states.LAUNCHED
		) {
			state = mine_states.LAUNCHED;

			shift_ratio = 0;
			if (instance_exists(obj_game_manager.players[summoner.target - 1])) {
				direction = point_direction(x, y, target.x, target.y);
			} else {
				direction = point_direction(
					x,
					y,
					obj_game_manager.players_x[summoner.target - 1],
					obj_game_manager.players_y[summoner.target - 1]
				);
			}
			image_angle = direction;
			if (instance_exists(tracker)) {
				tracker.shoot(target.x, target.y);
			}
			xaccel = lengthdir_x(accel, direction);
			yaccel = lengthdir_y(accel, direction);
			//hp=1;
			shot = true;
			summoner.meter += 1;
			var s_fire = audio_play_sound(sfx_fire, 0, false);
			audio_sound_pitch(s_fire, random_range(0.8, 1.2));
			var _scale = 7 / 60 * radius;
			var _shrink = -0.1 * _scale;
			part_type_size(obj_particle_setup.pt_sendstone, _scale, _scale, _shrink, 0);

			part_particles_create_color(
				obj_particle_setup.particle_system,
				x,
				y,
				obj_particle_setup.pt_sendstone,
				color,
				1
			);
			active = true;
		}
	}

	if (!active) {
		x = lerp(x, shift_x, shift_ratio);
		y = lerp(y, shift_y, shift_ratio);
	}
	if (point_distance(x, y, room_width / 2, room_height / 2) > max_distance_from_center) {
		if (instance_exists(summoner_original)) {
			for (var i = 0; i < array_length(summoner_original.summons); i++) {
				if (summoner_original.summons[i] == id) {
					array_delete(summoner_original.summons, i, 1);
					summoner_original.current_summon -= 1;
					break;
				}
			}
		}
		if (instance_exists(tracker)) {
			tracker.clouds = 0;
		}
		instance_destroy();
	}
}

spd = point_distance(0, 0, xspd, yspd);

if (spd > 1) {
	if (instance_exists(tracker)) {
		tracker.use_start = true;
	}
}
