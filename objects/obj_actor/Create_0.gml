/// @description Insert description here
// You can write your code in this editor

xspd=0;
yspd=0;
accel=2;
maxspeed=10;
decel=2;
hmove=0;
vmove=0;
hmove_prev=1;
vmove_prev=0;
player_number=1;
target=2
current_summon=0;
max_summon=5;
summons=[];

iframes=15;
hittable=true;
hp=10;

actionable=false;

summon_mine_check=false;
mine_shoot_check=false;
melee_check=false;
ultimate_check=false;
ultimate_cost=50;


fd_check_pressed=false;
fd_check=false;
fd_cost=20;
fd_triggered=false;

melee_cooldown=10;
can_melee=true;

dash_init=false;
dashing=false;
dash_release=false;
stamina=100;

movement_multiplier=1;
dash_multiplier=1.2;

stamina_recover=true;

meter = 0;
color=c_white

meter_gain=true;

particles=pointer_null

summon_particles=pointer_null

sound_played=[false,false]

stamina_color=c_white;

push_xspd=0;
push_yspd=0;

push_distance=50;

shooting=false;
shoot_radius=0;

summon_mine = function(){
	dashing=false;
	var summon = instance_create_layer(x,y,"bullets",obj_mine)
	summon.target=obj_game_manager.players[target-1]
	summon.summoner=obj_game_manager.players[player_number-1]
	summon.summoner_original=obj_game_manager.players[player_number-1]
	summon.color=color
	array_push(summons,summon);
	summon.particles=summon_particles
	meter+=5;
	summon.tracker = instance_create_layer(x,y,"particles",obj_tracker)
	summon.tracker.mine=summon
	summon.tracker.summoner=obj_game_manager.players[player_number-1]
	audio_play_sound(sfx_summon,0,false)
	if(current_summon>max_summon){
		instance_destroy(summons[0].tracker)
		instance_destroy(summons[0])
		array_delete(summons,0,1)
	}
	
}

shoot_mines = function(){
	dashing=false;
	for(i=0;i<array_length(summons);i++){
		try{
			summons[i].shoot()
		}catch(_exception){
			
		}
	}
	summons=[]
	current_summon=0;
	audio_play_sound(sfx_shoot,0,false)
}

melee = function(){
	dashing=false;
	var bullet = instance_create_layer(x,y,"bullets", obj_melee);
	can_melee=false;
	bullet.summoner=obj_game_manager.players[player_number-1]
	bullet.target=obj_game_manager.players[target-1]
	bullet.summoner_original=obj_game_manager.players[player_number-1]
	alarm[0]=melee_cooldown
	hittable=false;
	audio_play_sound(sfx_melee,0,false)
}

ultimate = function(){
	dashing=false;
	for(i=0;i<5;i++){
		var summon = instance_create_layer(x+random_range(-200,200),y+random_range(-200,200),"bullets",obj_mine)
		summon.target=obj_game_manager.players[target-1]
		summon.summoner=obj_game_manager.players[player_number-1]
		summon.summoner_original=obj_game_manager.players[player_number-1]
		array_push(summons,summon);
		summon.color=color
		summon.particles=summon_particles
		summon.tracker = instance_create_layer(x,y,"particles",obj_tracker)
	summon.tracker.mine=summon
	summon.tracker.summoner=obj_game_manager.players[player_number-1]
		
	}
	audio_play_sound(sfx_special,0,false)
	
}

draw_circle_width= function(inner_radius, width, segment, percentage){

		var radius = argument[0];
		var thickness = argument[1];
		var segments = argument[2];
		var jadd = 360/segments;
		draw_set_color(stamina_color);
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