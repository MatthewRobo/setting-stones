/// @description Insert description here
// You can write your code in this editor

trail_points = array_create(60, [x, y]);

xspd=0;
yspd=0;
//maxspeed=10;
decel=2;
hmove=0;
vmove=0;
hmove_prev=1;
vmove_prev=0;
player_number=1;
target=2
current_summon=0;
#macro max_summon 5
summons = [];

was_hit = false;

damage_mult = 1;

#macro iframes 15
hittable=true;
#macro low_hp 3
#macro max_hp 10
hp = max_hp;

#macro invuln_heat_recovery 0.4

actionable=false;

summon_mine_check=false;
mine_shoot_check=false;
melee_check=false;
ultimate_check=false;

#macro meter_max 100
#macro super_cost_normal 50
#macro super_cost_low_hp 25

super_cost = super_cost_normal;

dash_down = false;

#macro summon_cost 10
#macro summon_metergain 5
#macro shoot_cost 20
#macro melee_cost 20

fd_check_pressed=false;
fd_check=false;
#macro fd_cost 20
fd_triggered=false;

#macro melee_cooldown 10
can_melee = true;

dash_init=false;
dashing=false;
dash_release=false;
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

dir = 0;

#macro turn_speed 5

#macro crawl_speed 2.5
#macro walk_speed 10
#macro dash_speed 18
#macro tapdash_speed 26

move_speed = walk_speed;


stamina_recover = true;


meter = 0;
color=c_white;
color_up = c_green;
color_down = c_fuchsia;
color_left = c_aqua;
color_right = c_red;
color_front = c_purple;

color_slow = c_green;
color_fast = c_red;

#macro super_meter_lockout 60
#macro guard_meter_lockout 30
meter_gain = true;

particles=noone;

summon_particles=noone;

sound_played=[false,false];

stamina_color=c_white;

push_xspd=0;
push_yspd=0;

push_distance=50;

shooting=false;
shoot_radius=0;


do_summon = false;
do_shoot = false;
do_melee = false;
do_ultimate = false;

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
	if(!dash_init) {
		dash_down = false;
		dash_release = false;
		dash_lock = true;
	}


}

summon_mine = function(){
	do_summon = true;
	undash(true);
	var summon = instance_create_layer(x,y,"bullets",obj_mine)
	summon.target=obj_game_manager.players[target-1]
	summon.summoner=obj_game_manager.players[player_number-1]
	summon.summoner_original=obj_game_manager.players[player_number-1]
	summon.color=color
	summon.color_up = color_up;
	summon.color_down = color_down;
	summon.color_left = color_left;
	summon.color_right = color_right;
	summon.color_front = color_front;
	array_push(summons, summon);
	summon.particles = summon_particles;
	meter += summon_metergain;
	summon.tracker = instance_create_layer(x,y,"particles",obj_tracker)
	summon.tracker.mine=summon;
	summon.tracker.summoner=obj_game_manager.players[player_number-1];
	audio_play_sound(sfx_summon,0,false);
	summon.grow();
	
	var _current_summons = array_length(summons);
	
	while (_current_summons > max_summon) {
		instance_destroy(summons[0]);
		_current_summons = array_length(summons);
	}
}

shoot_mines = function(){
	do_shoot = true;
	undash(true);
	for(var i = 0; i < array_length(summons); i++){
		try {
			summons[i].shoot()
		} catch(_exception) {
			
		}
	}
	summons=[];
	current_summon=0;
	audio_play_sound(sfx_shoot,0,false);
}

melee = function(){
	do_melee = true;
	undash(true);
	var bullet = instance_create_layer(x,y,"bullets", obj_melee);
	can_melee=false;
	bullet.summoner=obj_game_manager.players[player_number-1]
	bullet.target=obj_game_manager.players[target-1]
	bullet.summoner_original=obj_game_manager.players[player_number-1]
	alarm[0]=melee_cooldown;
	//hittable=false;
	audio_play_sound(sfx_melee,0,false)
}

ultimate = function(){
	do_ultimate = true;
	undash();
	for(i=0;i<5;i++){
		var summon = instance_create_layer(x, y, "bullets", obj_mine);
		//var summon = instance_create_layer(x+random_range(-200,200),y+random_range(-200,200),"bullets",obj_mine)
		summon.target=obj_game_manager.players[target-1]
		summon.summoner=obj_game_manager.players[player_number-1]
		summon.summoner_original=obj_game_manager.players[player_number-1]
		
		summon.color=color;
		summon.color_up = color_up;
		summon.color_down = color_down;
		summon.color_left = color_left;
		summon.color_right = color_right;
		summon.color_front = color_front;
		summon.particles=summon_particles
		summon.tracker = instance_create_layer(x,y,"particles",obj_tracker)
		summon.tracker.mine=summon
		summon.tracker.summoner=obj_game_manager.players[player_number-1];
		
		//var _random_radius = 240;
		var _random_radius = sqrt(random(1)) * 240;
		var _random_angle = random(360);
		summon.shift_x = x + lengthdir_x(_random_radius, _random_angle);
		summon.shift_y = y + lengthdir_y(_random_radius, _random_angle);
		summon.shift_ratio = random_range(0.1, 0.3);
	}
	audio_play_sound(sfx_special,0,false)
	
}

draw_circle_width= function(inner_radius, width, segment, percentage){

		var radius = argument[0];
		var thickness = argument[1];
		var segments = argument[2];
		var jadd = 360/segments;
		//draw_set_color(stamina_color);
		draw_primitive_begin(pr_trianglestrip);
		for (var j = 0; j <= 360*percentage; j+=jadd)
		{
		    draw_vertex(x-lengthdir_x(radius,j),y+lengthdir_y(radius,j));


		  draw_vertex(x-lengthdir_x(radius+thickness,j),y+lengthdir_y(radius+thickness,j));
		    }
		draw_primitive_end();
}

draw_circle_width_shoot = function(inner_radius, width, segment){

		var radius = argument[0];
		var thickness = argument[1];
		var segments = argument[2];
		var jadd = 360/segments;
		draw_set_color(color);
		draw_primitive_begin(pr_trianglestrip);
		for (var j = 0; j <= 360; j+=jadd)
		{
		    draw_vertex(x-lengthdir_x(radius,j),y+lengthdir_y(radius,j));


		  draw_vertex(x-lengthdir_x(radius+thickness,j),y+lengthdir_y(radius+thickness,j));
		    }
		draw_primitive_end();
}

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