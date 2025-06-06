//part_particles_create(obj_particle_setup.particle_system,x,y,particles,1);
part_system_position(guard_particles, x, y);

if (global.hitstop <= 0) {
	array_delete(trail_points, 0, 1);
	array_push(trail_points, [x, y]);

	var _gotHit = false;
	var _mines = instance_number(obj_mine);

	for (var i = 0; i < _mines; i++) {
		var _mine = instance_find(obj_mine, i);

		if (instance_exists(_mine)) {
			if (_mine.summoner != id && _mine.active && instance_exists(_mine.summoner)) {
				var _dir = _mine.direction;
				if (point_distance(_mine.xprevious, _mine.yprevious, _mine.x, _mine.y) > 1) {
					_dir = point_direction(
						_mine.xprevious,
						_mine.yprevious,
						_mine.x,
						_mine.y
					);
				} else {
					_dir = point_direction(_mine.x, _mine.y, x, y);
				}
				var _r = _mine.radius;
				
				var _dx = lengthdir_x(_r, _dir + 90);
				var _dy = lengthdir_y(_r, _dir + 90);

				var _x1 = _mine.xprevious + _dx;
				var _y1 = _mine.yprevious + _dy;

				var _x2 = _mine.xprevious - _dx;
				var _y2 = _mine.yprevious - _dy;

				var _x3 = _mine.x + _dx;
				var _y3 = _mine.y + _dy;

				var _x4 = _mine.x - _dx;
				var _y4 = _mine.y - _dy;

				if (
					point_in_triangle(x, y, _x1, _y1, _x2, _y2, _x3, _y3)
					|| point_in_triangle(x, y, _x2, _y2, _x3, _y3, _x4, _y4)
					|| point_in_circle(x, y, _mine.x, _mine.y, _r)
				) {
					push_xspd = lengthdir_x(_r / 3, _dir);
					push_yspd = lengthdir_y(_r / 3, _dir);

					if (hittable && !shield_active) {
		
						
						invuln = iframes;
						var damage_taken = 1 * damage_mult;
						hp -= damage_taken;
						part_particles_create(
							obj_particle_setup.particle_system,
							x,
							y,
							obj_particle_setup.pt_hitspark,
							200 * damage_taken
						);


						global.hitstop += 4 * damage_taken;
						_mine.summoner.meter += 10;
						meter += 5;
						heat -= 33;
						was_hit = true;
						

						obj_game_manager.shrink = false;
						obj_game_manager.radius += 200;
						obj_game_manager.alarm[2] = 15 * 60;

						if (hp <= 0) {
							global.hitstop *= 4;
							instance_destroy();
						} else {
							audio_play_sound(sfx_hit, 0, false, 4);
						}
						
						create_slash(_dir + 90);
						
						hittable = false;
					}
					if (!shield_active || _mine.spd > 1) {
						instance_destroy(_mine);
					}
					
					create_slash(_dir);
				}
			}
		}
	}
}