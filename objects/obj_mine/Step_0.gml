/// @description Insert description here
// You can write your code in this editor

try{
	x+=xspd
	y+=yspd

	xspd+=xaccel
	yspd+=yaccel

	normalise_speed()

	tracker.x=x
	tracker.y=y

	if(instance_exists(summoner)){
		if(!shot && summoner.shooting && distance_to_object(summoner)<=summoner.shoot_radius && abs(distance_to_object(summoner)-summoner.shoot_radius)<100){
			try{
				direction=point_direction(x,y,target.x,target.y);
			}catch( _exception){
				direction=point_direction(x,y,x+1,y);	
			}
			image_angle=direction
			xaccel=lengthdir_x(accel,direction)
			yaccel=lengthdir_y(accel,direction);
			hp=1;
			shot=true
			summoner.meter+=1;
			audio_play_sound(sfx_fire,0,false)
		}
	}

	if(x<-100||x>room_width+100){
	
		for(i=0;i<array_length(summoner_original.summons);i++){	
			if(summoner_original.summons[i]==id){
				array_delete(summoner_original.summons,i,1);
				summoner_original.current_summon-=1;
				break;
			
			}
		}
		instance_destroy(tracker)
		instance_destroy()
	}
	if(y<-100||y>room_height+100){
	
		for(i=0;i<array_length(summoner_original.summons);i++){	
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