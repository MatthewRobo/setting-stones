/// @description Insert description here
// You can write your code in this editor

mine = noone;
summoner = noone;
color = c_black;
color_point = c_black;
color_base = c_purple;

//clouds = - 1;
clouds = -1;
x_start = x;
y_start = y;

is_super = true;

use_start = false;

lifetime = 45;

base_alpha = 0;
was_shot = false;

shoot = function(xTarget, yTarget) { 
	//part_type_colour1(obj_particle_setup.pt_rockwarning, color_base);
	////part_type_orientation(obj_particle_setup.pt_rockwarning, dir, dir, 0, 0, 0);
	//var _scale = mine.radius;
	//
	//part_type_size(obj_particle_setup.pt_rockwarning, _scale, _scale, 0, 0);
	//part_particles_create(
		//obj_particle_setup.particle_system,
		//x,
		//y,
		//obj_particle_setup.pt_rockwarning,
		//1
	//);
	
	var _dir = point_direction(xTarget, yTarget, x, y);
	
	part_type_colour2(obj_particle_setup.pt_warningsign, c_white, color_base);
	part_type_orientation(obj_particle_setup.pt_warningsign, _dir - 90, _dir - 90, 0, 0, 0);
	var _scale = mine.radius;
	
	var _dist = 60;
	
	part_type_size(obj_particle_setup.pt_warningsign, _scale, _scale, 0, 0);
	part_particles_create(
		obj_particle_setup.particle_system,
		xTarget + lengthdir_x(60, _dir),
		yTarget + lengthdir_y(60, _dir),
		obj_particle_setup.pt_warningsign,
		1
	);
	
	
	//var _xOrigin = x;
	//var _yOrigin = y;
	//var _x = x;
	//var _y = y;
//
	//if (clouds == -1) {
		//clouds = floor(point_distance(_xOrigin, _yOrigin, xTarget, yTarget) / (mine.radius * 2));
	//}
//
	//part_type_colour2(obj_particle_setup.pt_warningsign, color_point, color_base);
	//var _scale = mine.radius;
//
	//var _dir = point_direction(_xOrigin, _yOrigin, xTarget, yTarget);
//
	////part_type_direction(obj_particle_setup.ptype_trackerdust, _dir, _dir, 0, 0);
//
	//for (var i = 0; i < clouds; i++) {
		//var _lifetime = lerp(0, lifetime, i / clouds);
		////var _size = _scale * (_lifetime / lifetime) + 1;
		//part_type_life(obj_particle_setup.pt_warningsign, _lifetime, _lifetime);
		//part_type_size(obj_particle_setup.pt_warningsign, _scale, _scale, 0, 0);
		//var _length =
			//point_distance(_xOrigin, _yOrigin, xTarget, yTarget) / (clouds - 1);
		//part_particles_create(
			//obj_particle_setup.particle_system,
			//_x,
			//_y,
			//obj_particle_setup.pt_warningsign,
			//1
		//);
		//_x += lengthdir_x(_length, _dir);
		//_y += lengthdir_y(_length, _dir);
	//}
}