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

	//xspd += xaccel;
	//yspd += yaccel;

	normalise_speed();

	if (instance_exists(tracker)) {
		tracker.x = x;
		tracker.y = y;
	}

	if (instance_exists(summoner)) {
		rotation = point_direction(x, y, summoner.x, summoner.y);
		//lightDir = point_direction(x,y,summoner.x,summoner.y);
		if (
			summoner.shooting > 0
			&& summoner.shooting - lifetime < 5 
			&& distance_to_object(summoner) <= summoner.shoot_radius
			&& abs(distance_to_object(summoner) - summoner.shoot_radius) < 100
			&& state != mine_states.LAUNCHED
		) {
			state = mine_states.LAUNCHED;
			
			despawn_timer = 0;
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
			if (instance_exists(tracker) && instance_exists(target)) {
				
				tracker.shoot(target);
			}
			xspd = lengthdir_x(maxspeed, direction);
			yspd = lengthdir_y(maxspeed, direction);
			//hp=1;
			shot = true;
			summoner.meter += 1;
			var s_fire = audio_play_sound(sfx_fire, 0, false);
			audio_sound_pitch(s_fire, random_range(0.8, 1.2) * (1 + summoner.mines_shot * 0.025) / (radius / 50));
			show_debug_message(radius);
			summoner.mines_shot++;
			//audio_sound_pitch(s_fire, summoner.shoot_radius / 999 + 0.5);
			//audio_sound_pitch(s_fire, random_range(0.8, 1.2));
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
	//if (point_distance(x, y, room_width / 2, room_height / 2) > max_distance_from_center) {
		//if (instance_exists(summoner_original)) {
			//for (var i = 0; i < array_length(summoner_original.summons); i++) {
				//if (summoner_original.summons[i] == id) {
					//array_delete(summoner_original.summons, i, 1);
					//summoner_original.current_summon -= 1;
					//break;
				//}
			//}
		//}
		//if (instance_exists(tracker)) {
			//tracker.clouds = 0;
		//}
		//instance_destroy();
	//}
}

spd = point_distance(0, 0, xspd, yspd);

if (spd > 1) {
	if (instance_exists(tracker)) {
		tracker.use_start = true;
	}
}
var _angleDiff = abs(angle_difference(point_direction(0, 0, xspd, yspd), point_direction(x, y, room_width / 2, room_height / 2)));
show_debug_message(angle_difference(point_direction(0, 0, xspd, yspd), point_direction(x, y, room_width / 2, room_height / 2)));


if (x < 0 || x > room_width || y < 0 || y > room_height) {
	//if (state == mine_states.LAUNCHED) {
	//if (x < 0 && xspd < 0 || y < 0 && yspd < 0 || x > room_width && xspd > 0 || y > room_height && yspd > 0) {
		//instance_destroy();
	//}
//}
	
	
	show_debug_message(despawn_timer);

	if (_angleDiff >= 90) {
		despawn_timer++;

		if (state == mine_states.LAUNCHED && despawn_timer > 5) {
			instance_destroy();
		} else if (despawn_timer > 180) {
			instance_destroy();
		}
	} else {
		despawn_timer = 0;
	}
	
	

}