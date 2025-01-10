/// @description Insert description here
// You can write your code in this editor

if(other.summoner!=id && hittable && other.active && instance_exists(other.summoner)){
	hittable=false
	hp-=1;
	alarm[1]=iframes
	other.summoner.meter+=10;
	meter+=5;
	
	if(obj_game_manager.shrink){
			
		obj_game_manager.shrink=false
		
			obj_game_manager.alarm[2]=15*60	
		
	}
	
	if(hp==0){
		for(i=0;i<array_length(summons);i++){
			instance_destroy(summons[i])
		}
		obj_game_manager.winner_triggered=true;
		obj_game_manager.winner+=2-player_number+1
		audio_play_sound(sfx_dead,0,false,1)
		instance_destroy()	
	}else{
		audio_play_sound(sfx_hit,0,false,4)
	}
}
