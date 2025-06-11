/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enum mine_states {
	INERT,
	LAUNCHED,
	MELEED,
	SLOWED,
}

state = mine_states.INERT;

color = c_white;
color_up = c_green;
color_down = c_fuchsia;
color_left = c_aqua;
color_right = c_red;
color_front = c_purple;
depth_start = depth;
particles = part_type_create();
active = false;

tracker = noone;
accel = 75;
xaccel = 0;
yaccel = 0;
shot = false;

last_melee = noone;

shift_ratio = 0;
shift_x = x;
shift_y = y;

radius = sprite_width / 2;

sides = 5;
angles = [];
dists = [];
dists_in = [];
rotation = 0;
var _offset = random(360);
var _distMult = random_range(0.6, 0.8);

lightDir = 20;
lifetime = 0;
despawn_timer = 0;

#macro max_distance_from_center 5000

spawn_debris = true;

grow = function() {
	var _list = ds_list_create();
	var _num = instance_position_list(x, y, obj_mine, _list, false);
	if (_num > 1) {
		var _area = 0;
		var _hp = 0;
		var _x = 0;
		var _y = 0;
		for (var i = 0; i < _num; ++i) {
			_area += pi * power(_list[| i].radius, 2);
			_x += _list[| i].x;
			_y += _list[| i].y;
			_hp += _list[| i].hp;
			if (_list[| i] != id) {
				_list[| i].spawn_debris = false;
				if (instance_exists(_list[| i].last_melee)) {
					last_melee = _list[| i].last_melee;
				}
				instance_destroy(_list[| i]);
			}
		}
		radius = sqrt(_area / pi);
		var _scale = (radius * 2) / sprite_get_width(sprite_index);
		image_xscale = _scale;
		image_yscale = _scale;
		x = _x / _num;
		y = _y / _num;
		hp = _hp;
		var _bonusHp = hp - 1;
		var _distMult = random_range(0.6, 0.8);
		sides = 5 + _bonusHp;
		for (var i = 0; i < sides; i++) {
			angles[i] = i * (360 / sides);
			angles[i] = (i + random(0.5)) * (360 / sides);
			//dists[i] = irandom_range(60,72);
			dists[i] = random_range(radius, radius * 1.236) + 2 * _bonusHp;
			dists[i] = lerp(radius * 1.236, dists[i], 1 / power(x, 2));
			dists_in[i] = dists[i] * _distMult;
			dists_in[i] = lerp(radius, dists_in[i], 1 / power(x, 2));
		}
	}
	ds_list_destroy(_list);

	depth = depth_start + floor(radius / 50);
};

// slows down a meleed rock
shoot = function() {
	if (state == mine_states.MELEED) {
		state = mine_states.SLOWED;
		xaccel = 0;
		yaccel = 0;
		xspd = xspd * 0.1;
		yspd = yspd * 0.1;
	}
};
//
//while(place_meeting(x,y,target) && !active){
//x=summoner.x+random_range(-200,200);
//y=summoner.y+random_range(-200,200);
//}
//
//

alarm[0] = 30;

// when launched by melee hit
shoot_melee = function(melee) {
	state = mine_states.MELEED;
	direction = point_direction(melee.x, melee.y, x, y);
	image_angle = direction;
	xspd = lengthdir_x(maxspeed, direction);
	yspd = lengthdir_y(maxspeed, direction);
	//hp=1;
};

for (var i = 0; i < sides; i++) {
	//angles[i] = i * (360 / sides);
	angles[i] = (i + random(0.5)) * (360 / sides) + _offset;
	//dists[i] = irandom_range(60,72);
	dists[i] = random_range(radius, radius * 1.236);
	dists_in[i] = dists[i] * _distMult;
}

array_sort(angles, true);
