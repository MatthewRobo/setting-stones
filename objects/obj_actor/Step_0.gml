/// @description Insert description here
// You can write your code in this editor

if (global.hitstop >=  0) {
	summon_mine_check = max(summon_mine_check,  input_check_pressed("summon", player_number - 1));
	mine_shoot_check = max(mine_shoot_check,  input_check_pressed("shoot", player_number - 1));
	melee_check = max(melee_check,  input_check_pressed("melee", player_number - 1));
	dash_init = max(dash_init,  input_check_pressed("dash", player_number - 1));
	ultimate_check = max(ultimate_check,  input_check_pressed("ultimate", player_number - 1));
	fd_check_pressed = max(fd_check_pressed,  input_check_pressed("fd", player_number - 1));
}

if (global.hitstop <= 0) {
	was_hit = false;
	was_shieldbroken = false;
	
//if moving, apply acceleration. otherwise decelerate
hmove=input_check("right",player_number-1)-input_check("left",player_number-1)
vmove=input_check("down",player_number-1)-input_check("up",player_number-1)

if (point_distance(0,0, hmove, vmove) > 0) {
	target_dir = point_direction(0, 0, hmove, vmove);
}

var _current_dir = point_direction(0, 0, xspd, yspd);
var _angle_diff = angle_difference(_current_dir, target_dir);
var _next_dir = _current_dir - max(-1 * abs(_angle_diff), min(abs(_angle_diff ), turn_speed * sign(_angle_diff)));

//var _next_speed = maxspeed;

	if (global.hitstop < 0) {
		summon_mine_check=input_check_pressed("summon",player_number-1);
		mine_shoot_check=input_check_pressed("shoot",player_number-1);
		melee_check=input_check_pressed("melee",player_number-1);
		dash_init=input_check_pressed("dash",player_number-1);
		dash_down = input_check("dash",player_number-1);
		dash_release=input_check_released("dash",player_number-1);
		
		ultimate_check=input_check_pressed("ultimate",player_number-1);
		fd_check=input_check("fd",player_number-1);
		fd_check_pressed=input_check_pressed("fd",player_number-1);

	} else {
		summon_mine_check = max(summon_mine_check,  input_check_pressed("summon", player_number - 1));
		mine_shoot_check = max(mine_shoot_check,  input_check_pressed("shoot", player_number - 1));
		melee_check = max(melee_check,  input_check_pressed("melee", player_number - 1));
		dash_init = max(dash_init,  input_check_pressed("dash", player_number - 1));
		ultimate_check = max(ultimate_check,  input_check_pressed("ultimate", player_number - 1));
		fd_check_pressed = max(fd_check_pressed,  input_check_pressed("fd", player_number - 1));
	}

do_summon = false;
do_shoot = false;
do_melee = false;
do_ultimate = false;

if(hp <= low_hp){
	super_cost = super_cost_low_hp;
}

if(shoot_radius> 9999999){
	shoot_radius=0;
	shooting=false;
}

if(shooting){
	shoot_radius+=20;	
}


if(summon_mine_check && stamina>0){
	current_summon+=1;
	summon_mine();
	stamina -= summon_cost;
	alarm[2]=15;
	stamina_recover=false;
}

if(actionable){

	

	if(mine_shoot_check && stamina>0){
		shoot_mines()
		shooting=true;
		stamina -= shoot_cost;
		alarm[2]=60;
		
		shoot_radius=0;
		stamina_recover=false;
		meter+=5
	}

	if(melee_check && can_melee && stamina>0){
		melee()	
		stamina -= melee_cost;
		alarm[0]=melee_cooldown
		alarm[2]=30
		stamina_recover=false;
		meter+=5;
	}

	
	
	if(meter>=fd_cost && !sound_played[0]){
		audio_play_sound(sfx_power_up,0,false,1)	
		sound_played[0]=true
	}
	if(meter<fd_cost){
		sound_played[0]=false
	}
	
	if(meter>=super_cost && !sound_played[1]){
		audio_play_sound(sfx_power_up,0,false,1)	
		sound_played[1]=true
	}
	if(meter<fd_cost){
		sound_played[1]=false
	}
	
	if(ultimate_check && meter>=super_cost){
		meter-=super_cost
		meter_gain=false
		alarm[3]=60
		ultimate()
	}

	if(fd_check_pressed && meter>=fd_cost){
		audio_play_sound(sfx_faultless,0,false,2)
		meter-=fd_cost;
		meter_gain=false;
		hittable=false;
		fd_triggered=true;
		fd_check=true;
		heat -= 16; // held bar would give 16 for 20 meter/40 frames
		
	}

	if(fd_check && meter>0 && fd_triggered){
		hittable=false;
		meter-=0.5;
		meter_gain=false;
		alarm[3]=30;
		if(alarm[1]<1){
			alarm[1]=1
		}
	}
	if(fd_check){
		alarm[3]=30;
	}else{
		fd_triggered=false;	
	}
	
	if (meter <= 0.5) {
		if (fd_triggered) {
			meter = 0;
		}
		fd_triggered = false;
	}
}


	if(stamina_recover){
		stamina+=1;
	
	}
	
	//if (stamina_unlimit) {
		//stamina_inv_limit -= 0.5;
	//}
	


if (dashing <= -1 * nodash_heat_recovery_delay) {
	heat -= nodash_heat_recovery;
} else if (dashing <= 0) {
	heat -= heat_recovery;
}

if (!hittable) {
	heat -= invuln_heat_recovery;
	if (fd_triggered) {
		var _angle = random(360);
		var _radius = 100;
		
		var _dx = lengthdir_x(_radius, _angle);
		var _dy = lengthdir_y(_radius, _angle);
		
		var _particle = obj_particle_setup.particle_guard;
		part_type_direction(_particle, _angle + 180, _angle + 180, 0, 0);
		
		part_particles_create(guard_particles, _dx, _dy, _particle, 1);
	}
}

if (stamina < 0) {
	heat -= stamina;
}
heat = clamp(heat, 0, heat_max);
stamina_limit = stamina_max - heat;

stamina = clamp(stamina,0,stamina_limit);
damage_mult = floor((heat + 100) / 100);
if (damage_mult > 1) {
	if (damage_mult > 2) {
		part_type_speed(obj_particle_setup.particle_overheat, 3, 5, -0.02, 0); 
		part_type_colour3(obj_particle_setup.particle_overheat, $D8008F, $960096, $000000);
		
	} else {
		part_type_speed(obj_particle_setup.particle_overheat, 1, 2, -0.02, 0);
		part_type_colour3(obj_particle_setup.particle_overheat, $008FD8, $000096, $000000);
	}
	
	part_particles_create(obj_particle_setup.particle_system, x, y, obj_particle_setup.particle_overheat, damage_mult);
	
}
meter=clamp(meter, 0, meter_max);


if (stamina_recover) { // if dashing == 0 && tapdashing == 0
	move_speed = walk_speed;
} else {
	move_speed = crawl_speed;
}


if (dash_init) {
	dash_lock = false;
	tapdashing = tapdash_duration;
	audio_play_sound(sfx_dash,0,false)
	if (!audio_is_playing(dash_sfx)) {
		dash_sfx = audio_play_sound(sfx_noise, 0, true);
	}
	//stamina -= 5;
	if (move_speed < walk_speed) {
		heat += dashcancel_heat;
		part_particles_create(obj_particle_setup.particle_system,x,y,obj_particle_setup.particle_dashcancel,1);
	} else {
		heat += tapdash_heat;
	}

	_next_dir = target_dir;
}

if (dash_down && !dash_lock) {
	dashing = dash_duration;
	if (stamina_limit >= 0) {
		meter += 0.2;
	}
	heat += dashing_heat;
}


if (dash_release) {
	dash_lock = false;
}



if (tapdashing > 0) {
	dashing = dash_duration;
	move_speed = lerp(dash_speed, tapdash_speed, tapdashing / tapdash_duration);

	tapdashing--;
} else if (dashing > 0) {
	move_speed = lerp(walk_speed, dash_speed, dashing / dash_duration);
} else {
	_next_dir = target_dir;

	if (hmove == 0 && vmove == 0) {
		move_speed = 0;
	}
}
if (tapdashing <= 0) {
	dashing--;
	dashing = max(dashing, -1 * nodash_heat_recovery_delay);
}
xspd = lengthdir_x(move_speed, _next_dir);
yspd = lengthdir_y(move_speed, _next_dir);


move_radius();
decelerate_push(decel);

if (instance_exists(obj_game_manager.players[target-1])) {
	var _target = obj_game_manager.players[target-1];
	image_xscale = x < _target.x ? 1 : -1;
}

//anim_stamina_unlimit += heat_prev - heat;

anim_stamina_unlimit = lerp(anim_stamina_unlimit, stamina_limit, 0.1);
anim_stamina_limit = max(stamina_limit, lerp(anim_stamina_limit, stamina_limit, 0.4));
} else {
	if (was_hit) {
		repeat(50) {
			var _dir = 45 + choose(0, 90, 180, 270);
			var _x = x + random_range(-25, 25);
			var _y = y + random_range(-25, 25);
			part_type_colour3(pt_hit_x, $FFFFFF, color, color);
			part_type_direction(pt_hit_x, _dir, _dir, 0, 0);
			part_particles_create(obj_particle_setup.particle_system, _x, _y, pt_hit_x, 1);
		}
	}
	if (was_shieldbroken) {
		repeat(20) {
			//var _dir = random(360);
			//var _radius = sqrt(random(1)) * 100;
			
			//var _x = x + lengthdir_x(_radius, _dir);
			//var _y = y + lengthdir_y(_radius, _dir);
			
			part_particles_create(obj_particle_setup.particle_system, _x, _y, pt_shieldbreak, 1);
		}
	}
}


if (audio_is_playing(dash_sfx)) {
	var _dashVolume = sqrt((max(0, dashing) + max(0, tapdashing)) / (dash_duration + tapdash_duration));
	audio_sound_gain(dash_sfx, _dashVolume, 0);
}
