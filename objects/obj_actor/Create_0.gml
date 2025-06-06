/// @description Insert description here
// You can write your code in this editor

trail_points = array_create(60, [x, y]);

ps = part_system_create();

xspd = 0;
yspd = 0;
//maxspeed=10;
decel = 2.8;
hmove = 0;
vmove = 0;
hmove_prev = 1;
vmove_prev = 0;
player_number = 1;
target = 2;
current_summon = 0;
#macro max_summon 500
summons = [];
summons_reverse = [];

dash_sfx = -1;

was_hit = false;
was_shieldbroken = false;

damage_mult = 1;

#macro iframes 15
hittable = true;
invuln = 0;
#macro low_hp 1
#macro max_hp 10
hp = max_hp;
last_received_melee = noone;


#macro invuln_heat_recovery 0.4

actionable = false;

summon_mine_check = false;
mine_shoot_check = false;
melee_check = false;
super_check = false;

#macro meter_max 100
#macro super_cost_normal 50
#macro super_cost_low_hp 50
danger_meter_gain = 5 / 30;

super_cost = super_cost_normal;

dash_down = false;

#macro summon_cost 10
#macro summon_metergain 5
#macro shoot_cost 20
#macro melee_cost 10

shield_check_pressed = false;
shield_check = false;
#macro fd_cost 20
shield_active = false;

#macro melee_cooldown 10
can_melee = true;

dash_init = false;
dashing = false;
dash_release = false;
#macro stamina_max 100
stamina = stamina_max;
stamina_limit = stamina_max;
anim_stamina_limit = 0;

#macro heat_max 200
heat = 0;
//heat_recover = true;
tapdashing = 0;
#macro dash_duration 15
#macro tapdash_duration 15
#macro nodash_heat_recovery_delay 120
#macro nodash_heat_recovery 1
#macro heat_recovery 0.5

#macro dashcancel_heat 7
#macro tapdash_heat 7
#macro dashing_heat 0.65

heat_prev = heat;
anim_stamina_unlimit = 0;
lerp_heat = heat;

dir = 0;

#macro turn_speed 5

#macro crawl_speed 2.5
#macro walk_speed 10
#macro dash_speed 18
#macro tapdash_speed 26

move_speed = walk_speed;

#macro stamina_recovery 1
stamina_recover = true;

stamina_warning = 0;
#macro stamina_warning_duration 15

meter = 0;
color = c_white;
color_up = c_green;
color_down = c_fuchsia;
color_left = c_aqua;
color_right = c_red;
color_front = c_purple;

color_slow = c_green;
color_fast = c_red;

#macro super_meter_lockout 60
#macro guard_meter_lockout 30
//meter_gain = true;

particles = noone;

summon_particles = noone;

sound_played = [false, false];

stamina_color = c_white;

push_xspd = 0;
push_yspd = 0;

push_distance = 50;

shooting = 0;
shoot_radius = 0;
mines_shot = 0;

do_summon = false;
do_shoot = false;
do_melee = false;
do_super = false;

dash_lock = 0;
dash_lock_duration = 60;

target_dir = point_direction(0, 0, hmove, vmove);

guard_particles = part_system_create_layer("particles_top", false);
part_system_position(guard_particles, x, y);

function undash(uses_stamina = false) {
	if (uses_stamina) {
		stamina_recover = false;
	}

	dashing = min(0, dashing);
	tapdashing = 0;
	if (!dash_init) {
		dash_down = false;
		dash_release = false;
		dash_lock = true;
	}
}

summon_mine = function() {
	do_summon = true;
	undash(true);
	var _x = x;
	var _y = y;
	var _target = obj_game_manager.players[target - 1];
	if (instance_exists(_target)) {
		var _dir = point_direction(x, y, _target.x, _target.y);
		_x += lengthdir_x(1, _dir);
		_y += lengthdir_y(1, _dir);
	}
	var summon = instance_create_layer(_x, _y, "bullets", obj_mine);
	summon.target = obj_game_manager.players[target - 1];
	summon.summoner = obj_game_manager.players[player_number - 1];
	summon.summoner_original = obj_game_manager.players[player_number - 1];
	summon.color = color;
	summon.color_up = color_up;
	summon.color_down = color_down;
	summon.color_left = color_left;
	summon.color_right = color_right;
	summon.color_front = color_front;


	var _isNew = true;
	var _list = ds_list_create();
	var _num = instance_position_list(x, y, obj_mine, _list, false);
	if (_num > 1) {
		for (var i = 0; i < _num; ++i) {
			if (_list[| i] != summon.id && !array_contains(summons, _list[| i])) {
				_isNew = false;
			}
		}
	}
	ds_list_destroy(_list);

	if (_isNew) {
		array_push(summons, summon);
	}
	meter += summon_metergain;
	summon.tracker = instance_create_layer(x, y, "particles", obj_tracker);
	summon.tracker.mine = summon;
	summon.tracker.summoner = obj_game_manager.players[player_number - 1];
	audio_play_sound(sfx_summon, 0, false);
	summon.grow();

	summon.particles = summon_particles;
	part_type_color1(obj_particle_setup.pt_setstone, color);
	part_type_size(obj_particle_setup.pt_setstone, summon.radius / 50, -1, 0.6, 0);
	part_particles_create(
		obj_particle_setup.particle_system,
		summon.x,
		summon.y,
		obj_particle_setup.pt_setstone,
		1
	);

	var _current_summons = array_length(summons);

	while (_current_summons > max_summon) {
		instance_destroy(summons[0]);
		_current_summons = array_length(summons);
	}
};

shoot_mines = function() {
	do_shoot = true;
	undash(true);
    var _summoner = id;
    with (obj_mine) {
        if (summoner == _summoner) {
            shoot();
        }
    }
	//for (var i = 0; i < array_length(summons); i++) {
		//try {
			//summons[i].shoot();
		//} catch (_exception) {}
	//}
	summons = [];
	current_summon = 0;
	audio_play_sound(sfx_shoot, 0, false);
};

melee = function() {
	do_melee = true;
	undash(true);
	var bullet = instance_create_layer(x, y, "bullets", obj_melee);
	can_melee = false;
	bullet.summoner = obj_game_manager.players[player_number - 1];
	bullet.target = obj_game_manager.players[target - 1];
	bullet.summoner_original = obj_game_manager.players[player_number - 1];
	alarm[0] = melee_cooldown;
	//hittable=false;
	audio_play_sound(sfx_melee, 0, false);
};

ultimate = function() {
	do_super = true;
	undash();
	for (var i = 0; i < 5; i++) {
		var _target = obj_game_manager.players[target - 1];
		var _random_radius = sqrt(random(1)) * 240;
		var _random_angle = random(360);
		var _spawnAngle = _random_angle;

		if (instance_exists(_target)) {
			_spawnAngle = point_direction(x, y, _target.x, _target.y) + (i + 0.5) * 360 / 5;
			
		}
		var summon = instance_create_layer(x + lengthdir_x(1, _spawnAngle), y + lengthdir_y(1, _spawnAngle), "bullets", obj_mine);
		//var summon = instance_create_layer(x+random_range(-200,200),y+random_range(-200,200),"bullets",obj_mine)
		summon.target = _target;
		summon.summoner = obj_game_manager.players[player_number - 1];
		summon.summoner_original = obj_game_manager.players[player_number - 1];

		summon.color = color;
		summon.color_up = color_up;
		summon.color_down = color_down;
		summon.color_left = color_left;
		summon.color_right = color_right;
		summon.color_front = color_front;
		summon.particles = summon_particles;
		summon.tracker = instance_create_layer(x, y, "particles", obj_tracker);
		summon.tracker.mine = summon;
		summon.tracker.summoner = obj_game_manager.players[player_number - 1];

		//var _random_radius = 240;

		summon.shift_x = x + lengthdir_x(_random_radius, _random_angle);
		summon.shift_y = y + lengthdir_y(_random_radius, _random_angle);
		summon.shift_ratio = random_range(0.1, 0.3);
		
		part_type_color1(obj_particle_setup.pt_setstone, color);
		part_type_size(obj_particle_setup.pt_setstone, summon.radius / 50, -1, 0.6, 0);
		part_particles_create(
			obj_particle_setup.particle_system,
			summon.shift_x,
			summon.shift_y,
			obj_particle_setup.pt_setstone,
			1
		);
	}
	audio_play_sound(sfx_special, 0, false);
};

draw_circle_width = function(inner_radius, width, segment, percentage) {
	var radius = argument[0];
	var thickness = argument[1];
	var segments = argument[2];
	var jadd = 360 / segments;
	//draw_set_color(stamina_color);
	draw_primitive_begin(pr_trianglestrip);
	for (var j = 0; j <= 360 * percentage; j += jadd) {
		draw_vertex(x - lengthdir_x(radius, j), y + lengthdir_y(radius, j));

		draw_vertex(
			x - lengthdir_x(radius + thickness, j),
			y + lengthdir_y(radius + thickness, j)
		);
	}
	draw_primitive_end();
};

draw_circle_width_shoot = function(inner_radius, width, segment) {
	var radius = argument[0];
	var thickness = argument[1];
	var segments = argument[2];
	var jadd = 360 / segments;
	draw_set_color(color);
	draw_primitive_begin(pr_trianglestrip);
	for (var j = 0; j <= 360; j += jadd) {
		draw_vertex(x - lengthdir_x(radius, j), y + lengthdir_y(radius, j));

		draw_vertex(
			x - lengthdir_x(radius + thickness, j),
			y + lengthdir_y(radius + thickness, j)
		);
	}
	draw_primitive_end();
};

// particles
pt_hit_x = part_type_create();
part_type_shape(pt_hit_x, pt_shape_line);
part_type_size(pt_hit_x, 0, 1, 0, 0);
part_type_scale(pt_hit_x, 1, 1);
part_type_speed(pt_hit_x, 10, 25, -0.65, 0);
part_type_direction(pt_hit_x, 135, 135, 0, 0);
part_type_gravity(pt_hit_x, 0, 270);
part_type_orientation(pt_hit_x, 0, 0, 0, 0, true);
part_type_colour3(pt_hit_x, $FFFFFF, $FFFF00, $FF0000);
part_type_alpha3(pt_hit_x, 0, 1, 0);
part_type_blend(pt_hit_x, true);
part_type_life(pt_hit_x, 10, 40);

pt_shieldbreak = part_type_create();
part_type_sprite(pt_shieldbreak, spr_triangle, false, true, false);
part_type_size(pt_shieldbreak, 0, 1.5, -0.01, 0);
part_type_scale(pt_shieldbreak, 1, 0.25);
part_type_speed(pt_shieldbreak, 7, 11, -0.6, 0);
part_type_direction(pt_shieldbreak, 0, 360, 0, 0);
part_type_gravity(pt_shieldbreak, 0, 270);
part_type_orientation(pt_shieldbreak, 180, 180, 0, 0, true);
part_type_colour3(pt_shieldbreak, $AFE1AF, $AFE1AF, $00FF00);
part_type_alpha3(pt_shieldbreak, 1, 1, 0);
part_type_blend(pt_shieldbreak, true);
part_type_life(pt_shieldbreak, 20, 90);

pt_hit_slash = part_type_create();
part_type_shape(pt_hit_slash, pt_shape_spark);
part_type_size(pt_hit_slash, 1, 1, 0, 0);
part_type_scale(pt_hit_slash, 1, 1);
part_type_speed(pt_hit_slash, 25, 25, 0, 0);
part_type_direction(pt_hit_slash, 0, 0, 0, 0);
part_type_gravity(pt_hit_slash, 0, 270);
part_type_orientation(pt_hit_slash, 0, 360, 0, 0, true);
part_type_colour3(pt_hit_slash, $FFFFFF, $FFFF00, $FF0000);
part_type_alpha3(pt_hit_slash, 0, 1, 0);
part_type_blend(pt_hit_slash, false);
part_type_life(pt_hit_slash, 30, 30);

trail = instance_create_layer(x, y, "player_trail", obj_player_trail);
trail.summoner = id;

function create_slash(dir) {
	for (var percent = 0; percent <= 1; percent += 1 / max(500, 80 * global.hitstop)) {

		part_type_colour3(pt_hit_slash, c_white, color, color);
		var _pSize = lerp(0.5, 0.1, percent);
		var _pSpd = lerp(0, 16, percent);
		part_type_size(pt_hit_slash, _pSize, _pSize, 0, false);
		part_type_speed(pt_hit_slash, _pSpd, _pSpd, 0, false);
		part_type_direction(pt_hit_slash, dir, dir, 0, 0);
		part_type_alpha2(pt_hit_slash, 1, 0);
		part_type_blend(pt_hit_slash, true);
		part_type_life(pt_hit_slash, 10 * max(2, global.hitstop), max(2, 10 * global.hitstop));
		part_particles_create(
			obj_particle_setup.particle_system,
			x,
			y,
			pt_hit_slash,
			1
		);
		
		part_type_direction(pt_hit_slash, dir + 180, dir + 180, 0, 0);
		part_particles_create(
			obj_particle_setup.particle_system,
			x,
			y,
			pt_hit_slash,
			1
		);

	}
}