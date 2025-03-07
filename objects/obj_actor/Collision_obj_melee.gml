/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	if (id != other.summoner) {
		var _direction = point_direction(other.x, other.y, self.x, self.y);

		push_xspd = lengthdir_x(push_distance, _direction);
		push_yspd = lengthdir_y(push_distance, _direction);
	}

	if (
		other.summoner != id
		&& hittable
		&& other.active
		&& instance_exists(other.summoner)
		&& other != last_received_melee
	) {
		var _dir = 0;
		if (point_distance(other.xprevious, other.yprevious, other.x, other.y) > 1) {
			_dir = point_direction(
				other.xprevious,
				other.yprevious,
				other.x,
				other.y
			);
		} else {
			_dir = point_direction(x, y, other.x, other.y);
		}
		
		hittable = false;
		was_hit = true;

		var damage_taken = 2 * damage_mult;
		last_received_melee = other;
		if (shield_active) {
			was_shieldbroken = true;
			shield_active = false;
			global.hitstop += 4 * damage_taken;
			audio_play_sound(sfx_shieldbreak, 0, false, 5);
		}
		hp -= damage_taken;
		part_particles_create(
			obj_particle_setup.particle_system,
			x,
			y,
			obj_particle_setup.pt_hitspark,
			200 * damage_taken
		);
		global.hitstop += 4 * damage_taken;
		alarm[1] = iframes;
		other.summoner.meter += 10;
		meter += 5;
		heat -= 33;

		if (obj_game_manager.shrink) {
			obj_game_manager.shrink = false;
			obj_game_manager.radius += 200;
			obj_game_manager.alarm[2] = 15 * 60;
		}

		if (hp <= 0) {
			global.hitstop *= 4;
			instance_destroy();
		} else {
			audio_play_sound(sfx_hit, 0, false, 4);
		}
		
		create_slash(_dir);
		create_slash(_dir + 90);

		//instance_destroy(other);
	}
}
