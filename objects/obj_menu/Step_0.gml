/// @description Insert description here
// You can write your code in this editor

//If we get some new input from a source...
var _new = input_source_detect_new();
if (_new != undefined)
{
	//And we don't already have a source assigned...
	if (array_length(input_source_get_array(0)) <= 0)
	{
		
	    //Then set this new source as our current
	    input_source_set(_new,0);
		input_player_ghost_set(false, 0)
		alarm[0]=5;

	}else if (array_length(input_source_get_array(1)) <= 0)
	{
	    //Then set this new source as our current
	    input_source_set(_new,1);
		input_player_ghost_set(false, 1)
		alarm[1]=5;

	}
}

if (input_join_is_finished() && !input_player_ghost_get(0) && !input_player_ghost_get(1))
{
    input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
}

if(keyboard_check_pressed(vk_f3)){
	submenu=1;	
	
}

if(keyboard_check_pressed(vk_f1)){
	control_connected[0]=false;
	input_profile_reset_bindings("keyboard_and_mouse",0)
	input_profile_reset_bindings("gamepad",0)
	input_player_ghost_set(true, 0)
	input_binding_scan_abort(0)		
}

if(keyboard_check_pressed(vk_f2)){
	control_connected[1]=false;
	input_profile_reset_bindings("keyboard_and_mouse",1)
	input_profile_reset_bindings("gamepad",1)
	input_player_ghost_set(true, 1)
	input_binding_scan_abort(1)		
}

if(submenu==0){
	if(input_check_pressed("down",0) ||	input_check_pressed("down",1)){
		select+=1
		select=select%array_length(menu_options)
	}
	if(input_check_pressed("up",0) ||	input_check_pressed("up",1)){
		select-=1
		if(select<0){
			select=array_length(menu_options)-1
		}
	}
	if(input_check("summon",0) && input_check("summon",1)){
		
		if(select==0){
			room_goto(gameplay)	
		}
		if(select==1){
			submenu=1
			control_connected=[false,false]
			alarm[0]=5;
			alarm[1]=5;
		}
		if(select==2){
			submenu=2
		}
	}
	
}

if(submenu==1){
	input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
	if(input_check_pressed("down",0) && control_connected[0]){
		control_select[0]+=1;
		control_select[0]=control_select[0]%3
	}
	if(	input_check_pressed("down",1)){
		control_select[1]+=1;
		control_select[1]=control_select[1]%3
	}
	if(input_check_pressed("up",0) && control_connected[0]){
		control_select[0]-=1;
		if(control_select[0]<0){
			control_select[0]=2
		}
		
	}
	if(input_check_pressed("up",1)){
		control_select[1]-=1;
		if(control_select[1]<0){
			control_select[1]=2
		}
	}
	if(input_check_pressed("summon",0) && control_connected[0]){
		if(control_select[0]==0){
			binded[0]=false;
			index[0]=0;
			//for(i=0;i<array_length(verbs);i++){
			//	input_binding_remove(verbs[i],0)
			//}
			
		}
		if(control_select[0]==1){
			input_profile_reset_bindings("keyboard_and_mouse",0)
			input_profile_reset_bindings("gamepad",0)	
		}
		if(control_select[0]==2 ){
			
			control_connected[0]=false;
			input_profile_reset_bindings("keyboard_and_mouse",0)
			input_profile_reset_bindings("gamepad",0)
			input_player_ghost_set(true, 0)
			input_binding_scan_abort(0)	
		}
		
	}
	if(input_check_pressed("summon",1) && control_connected[1]){
		if(control_select[1]==0){
			binded[1]=false;
			index[1]=0;
			//for(i=0;i<array_length(verbs);i++){
			//	input_binding_remove(verbs[i],0)
			//}
			
		}
		if(control_select[1]==1){
			input_profile_reset_bindings("keyboard_and_mouse",1)
			input_profile_reset_bindings("gamepad",1)	
		}
		if(control_select[1]==2){
			
			control_connected[1]=false;
			input_profile_reset_bindings("keyboard_and_mouse",1)
			input_profile_reset_bindings("gamepad",1)
			input_player_ghost_set(true, 1)
			input_binding_scan_abort(1)	
		}
		
	}
	//if(input_check_pressed("summon",1)){
	//	if(select==1){
	//		submenu=1
	//	}
	//	if(select==2){
	//		submenu=2
	//	}
	//}
	if(input_check("dash",0) && input_check("dash",1)){
		submenu=0
	}
	
}

if(submenu==2){

	if(input_check("dash",0) && input_check("dash",1)){
		submenu=0
	}
	
}

controls = [
	[input_binding_get("up",0), 
	input_binding_get("left",0), 
	input_binding_get("down",0), 
	input_binding_get("right",0), 
	input_binding_get("summon",0), 
	input_binding_get("shoot",0), 
	input_binding_get("melee",0), 
	input_binding_get("dash",0), 
	input_binding_get("ultimate",0), 
	input_binding_get("fd",0)],
	
	[input_binding_get("up",1), 
	input_binding_get("left",1), 
	input_binding_get("down",1), 
	input_binding_get("right",1), 
	input_binding_get("summon",1), 
	input_binding_get("shoot",1), 
	input_binding_get("melee",1), 
	input_binding_get("dash",1), 
	input_binding_get("ultimate",1), 
	input_binding_get("fd",1)]
];

for(i=0;i<array_length(controls);i++){
	for(j=0;j<array_length(controls[i]);j++){
		if(controls[i][j].__value==undefined){
			controls[i][j].__value=256;
		}
	}
}

if (array_length(input_source_get_array(0)) > 0 && !control_connected[0] && submenu==0)
{
	alarm[0]=5;
}
if (array_length(input_source_get_array(1)) > 0 && !control_connected[1] && submenu==0)
{
	alarm[1]=5;
}

show_debug_message("p1: "+string(array_length(input_source_get_array(0))))
show_debug_message("p2: "+string(array_length(input_source_get_array(1))))

