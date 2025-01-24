/// @description countdown
// You can write your code in this editor

seconds += 1;
opacity = 1;
if (seconds >= 3) {
	players[0].actionable = true;
	players[1].actionable = true;
} else {
	if (seconds == 4) {
		alarm[0] = 15;
	} else {
		alarm[0] = 60;
		if (seconds == 3) {
			audio_play_sound(sfx_go, 0, false);
		} else {
			audio_play_sound(sfx_countdown, 0, false);
		}
	}
}
