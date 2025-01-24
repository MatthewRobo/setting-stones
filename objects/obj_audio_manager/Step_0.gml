/// @description Insert description here
// You can write your code in this editor

if (room_get_name(room) == "start" && audio_group_is_loaded(audiogroup_sfx)) {
	//if(room_get_name(room)=="start" && audio_group_is_loaded(audiogroup_bgm) && audio_group_is_loaded(audiogroup_sfx)){
	room_goto_next();
}

if (keyboard_check_pressed(vk_escape)) {
	global.BGM_MUTE = !global.BGM_MUTE;
}

if (!global.BGM_MUTE && !audio_is_playing(global.BGM)) {
	global.BGM = shuffle_bgm();
	audio_play_sound(global.BGM, false, false);
} else if (global.BGM_MUTE) {
	audio_stop_sound(global.BGM);
}
