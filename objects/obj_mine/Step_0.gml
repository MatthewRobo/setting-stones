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
	repeat(_particles) {
		var _random_radius = sqrt(random(1)) * radius;
		var _random_angle = random(360);
		part_particles_create(obj_particle_setup.particle_system, x + lengthdir_x(_random_radius, _random_angle), y + lengthdir_y(_random_radius, _random_angle),particles,1);
	} 
}

try{
	x+=xspd
	y+=yspd

	xspd+=xaccel
	yspd+=yaccel

	normalise_speed()

	tracker.x=x
	tracker.y=y

	if(instance_exists(summoner)){
		rotation = point_direction(x,y,summoner.x,summoner.y);
		//lightDir = point_direction(x,y,summoner.x,summoner.y);
		if(!shot && summoner.shooting && distance_to_object(summoner)<=summoner.shoot_radius && abs(distance_to_object(summoner)-summoner.shoot_radius)<100){
			shift_ratio = 0;
			try{
				direction=point_direction(x,y,target.x,target.y);
			}catch( _exception){
				direction=point_direction(x,y,x+1,y);
			}
			image_angle=direction;
			xaccel=lengthdir_x(accel,direction);
			yaccel=lengthdir_y(accel,direction);
			//hp=1;
			shot=true;
			summoner.meter+=1;
			var s_fire = audio_play_sound(sfx_fire,0,false);
			audio_sound_pitch(s_fire, random_range(0.8, 1.2));
			var _scale = 7 / 60 * radius;
			var _shrink = -0.1 * _scale;
			part_type_size(obj_particle_setup.particle_sendstone, _scale, _scale, _shrink, 0);
			
			part_particles_create_color(obj_particle_setup.particle_system, x, y, obj_particle_setup.particle_sendstone, color, 1);
			active = true;
		}
	}
	
	if (!active) {
		x = lerp(x, shift_x, shift_ratio);
		y = lerp(y, shift_y, shift_ratio);
	}
	

	if(x < -1000 || x > room_width + 1000) {
	
		for(var i=0;i<array_length(summoner_original.summons);i++){	
			if(summoner_original.summons[i]==id){
				array_delete(summoner_original.summons,i,1);
				summoner_original.current_summon-=1;
				break;
			
			}
		}
		instance_destroy(tracker)
		instance_destroy()
	}
	if(y < -1000 || y > room_height + 1000){
	
		for(var i=0;i<array_length(summoner_original.summons);i++){	
			if(summoner_original.summons[i]==id){
				array_delete(summoner_original.summons,i,1);
				summoner_original.current_summon-=1;
				break;
			}
		}
		instance_destroy(tracker)
		instance_destroy()
	}
}catch(_exception){
	
}
	}
	
