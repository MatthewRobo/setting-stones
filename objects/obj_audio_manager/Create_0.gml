/// @description Insert description here
// You can write your code in this editor

persistent = true;

//audio_group_load(audiogroup_bgm);
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_bgm);

function shuffle_bgm() {
	return choose(
		bgm_and_intelligence,
		bgm_death_of_the_endless_duvet,
		bgm_dolphika,
		bgm_end_roll,
		bgm_main,
		bgm_our_love,
		bgm_programmed_gaia,
		bgm_qixpin,
		bgm_ufo_smasher,
		bgm_volcanos,
		bgm_you_win_some_you_nuke_some,
		bgm_meh_tuhl_hedz_von_dutch,
		bgm_tellin_myself,
		bgm_grenade,
		bgm_hype,
		bgm_carry_me_away,
		bgm_completeness_under_incompleteness,
		bgm_ether_strike,
		bgm_goldenslaughterer,
		bgm_resurrectedreplayer
	);
}

global.BGM = shuffle_bgm();
global.BGM_MUTE = false;

audio_play_sound(sfx_gameboot, 0, false);
