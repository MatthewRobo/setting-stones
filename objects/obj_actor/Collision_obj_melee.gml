/// @description Insert description here
// You can write your code in this editor

if (global.hitstop <= 0) {
	
	if(id!=other.summoner){
		var _direction=point_direction(other.x,other.y,self.x,self.y)
	
		push_xspd=lengthdir_x(push_distance,_direction)
		push_yspd=lengthdir_y(push_distance,_direction);
	}

	if(other.summoner!=id && other.active && instance_exists(other.summoner)){
		hittable=false;
		was_hit = true;

		var damage_taken = 2 * damage_mult;
		if (shield_active) {
			was_shieldbroken = true;
			shield_active = false;
			global.hitstop += 4 * damage_taken;
			audio_play_sound(sfx_shieldbreak, 0, false, 5);
		}
		hp -= damage_taken;
		part_particles_create(obj_particle_setup.particle_system,x,y,obj_particle_setup.particle_hitspark,200 * damage_taken);
		global.hitstop += 4 * damage_taken;
		alarm[1]=iframes
		other.summoner.meter+=10;
		meter+=5;
		heat -= 33;
	
		if(obj_game_manager.shrink){
			
			obj_game_manager.shrink=false;
			obj_game_manager.radius += 200;
			obj_game_manager.alarm[2]=15*60;
		
		}
	
		if(hp <= 0){
			for(var i=0;i<array_length(summons);i++){
				instance_destroy(summons[i])
			}
			obj_game_manager.winner_triggered=true;
			obj_game_manager.winner+=2-player_number+1
			audio_play_sound(sfx_dead,0,false,1)
			instance_destroy()	
		}else{
			audio_play_sound(sfx_hit,0,false,4)
		}
		
		instance_destroy(other);
	}
	
}
	
