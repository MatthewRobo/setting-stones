/// @description Insert description here
// You can write your code in this editor

if(room_get_name(room)=="start" && audio_group_is_loaded(audiogroup_bgm) && audio_group_is_loaded(audiogroup_sfx)){
	audio_play_sound(bgm_main,0,true)
	room_goto_next();
}

if(keyboard_check_pressed(vk_escape)){
	if(audio_group_get_gain(audiogroup_bgm)==1){
		audio_group_set_gain(audiogroup_bgm,0,0.5)
	}else{
		audio_group_set_gain(audiogroup_bgm,1,0.5)
	}
}