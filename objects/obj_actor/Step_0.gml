/// @description Insert description here
// You can write your code in this editor


//if moving, apply acceleration. otherwise decelerate
hmove=input_check("right",player_number-1)-input_check("left",player_number-1)
vmove=input_check("down",player_number-1)-input_check("up",player_number-1)
summon_mine_check=input_check_pressed("summon",player_number-1)
mine_shoot_check=input_check_pressed("shoot",player_number-1)
melee_check=input_check_pressed("melee",player_number-1)
dash_init=input_check_pressed("dash",player_number-1)
dash_release=input_check_released("dash",player_number-1)

ultimate_check=input_check_pressed("ultimate",player_number-1)
fd_check=input_check("fd",player_number-1)
fd_check_pressed=input_check_pressed("fd",player_number-1)

if(hp<=3){
	ultimate_cost=25;	
	
}

if(!dashing){
	xspd = maxspeed * hmove * movement_multiplier;
	yspd = maxspeed * vmove * movement_multiplier;
	if(hmove==0){
		xspd=0;	
	}else{
		
	}
	if(vmove==0){
		yspd=0;	
	}else{
	
	}
}else{
	xspd += accel * hmove * movement_multiplier;
	yspd += accel * vmove * movement_multiplier;
	if(hmove==0){
		if(abs(xspd)<decel){
			xspd=0	
		}else{
			xspd-=sign(xspd)*decel	
		}
	}else{
		
	}
	if(vmove==0){
		if(abs(yspd)<decel){
			yspd=0	
		}else{
			yspd-=sign(yspd)*decel	
		}	
	}else{
	
	}
}

if(!(vmove==0 && hmove==0)){
	vmove_prev=vmove
	hmove_prev=hmove
}


xspd=clamp(xspd,-maxspeed * movement_multiplier,maxspeed * movement_multiplier)
yspd=clamp(yspd,-maxspeed * movement_multiplier,maxspeed * movement_multiplier)
normalise_speed_diff(maxspeed*movement_multiplier)

move_radius();
decelerate_push(decel)

if(shoot_radius>room_width){
	shoot_radius=0;
	shooting=false;
}

if(shooting){
	shoot_radius+=20;	
}

if(dash_init){
		dashing=true;
		if(movement_multiplier<1){
			stamina-=10;	
		}
		audio_play_sound(sfx_dash,0,false)
	}
	if(dash_release){
		dashing=false;	
		stamina_recover=true;
	}

	if(dashing && stamina>0){
		movement_multiplier=3
		stamina-=1
		stamina_recover=false;
		meter+=0.2

	}else{

		if(stamina_recover){
			movement_multiplier=1	
		}else{
			movement_multiplier=0.25
		}
	}
	if(summon_mine_check && stamina>0){
			current_summon+=1;
			summon_mine();
			stamina-=10
		alarm[2]=15
		stamina_recover=false;
	}

if(actionable){

	

	if(mine_shoot_check && stamina>0){
		shoot_mines()
		shooting=true;
		stamina-=20
		alarm[2]=60
		shoot_radius=0;
		stamina_recover=false;
		meter+=5
	}

	if(melee_check && can_melee && stamina>0){
		melee()	
		stamina-=20
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
	
	if(meter>=ultimate_cost && !sound_played[1]){
		audio_play_sound(sfx_power_up,0,false,1)	
		sound_played[1]=true
	}
	if(meter<fd_cost){
		sound_played[1]=false
	}
	
	if(ultimate_check && meter>=ultimate_cost){
		meter-=ultimate_cost
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
	}

	if(fd_check && meter>0 && fd_triggered){
		hittable=false;
		meter-=0.5;
		meter_gain=false
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

	if(stamina_recover){
		stamina+=1;
	
	}
	stamina=clamp(stamina,0,100)

	

	meter=clamp(meter,0,100)

}