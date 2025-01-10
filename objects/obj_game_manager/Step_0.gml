/// @description Insert description here
// You can write your code in this editor
opacity-=1/45
if(winner==0){
	colors=[obj_player_1.color,obj_player_2.color]	
}
if(winner>0 && winner_triggered){
	winner_triggered=false;
	alarm[1]=120;
}

if(shrink && winner==0 && radius>=radius_minimum){
	radius-=0.25
}

if(!shrink && winner==0 && radius<radius_initial){
	radius+=0.25
}


show_debug_message(alarm[2])
if(end_game){
	if (input_check_long(["summon","dash"], 0) && input_check_long(["summon","dash"], 1))
    {
        if (input_check_long("summon", 0) && input_check_long("summon", 1))
	    {     
	        room_restart()
	    }else{
			input_player_disconnect(0)
			input_player_disconnect(1)
			room_goto(menu)	
		}
    }
	
}