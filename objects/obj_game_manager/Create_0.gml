/// @description Insert description here
// You can write your code in this editor
game_set_speed(60, gamespeed_fps);
global.hitstop = 0;
enum end_options {
	REMATCH,
	EXIT,
}

endDisplay = ["Rematch", "Return to Main Menu"];

radius_initial = room_width * 0.4;

radius = radius_initial;

#macro radius_minimum 150
shrink = false;
#macro shrink_radius 0.66

display_radius = radius;

opacity = 1;

countdown = 60 * 3;
countup = 0;

#macro start_distance 500
players = [
	instance_create_layer(
		(room_width - start_distance) / 2,
		room_height / 2,
		"instances",
		obj_player_1
	),
	instance_create_layer(
		(room_width + start_distance) / 2,
		room_height / 2,
		"instances",
		obj_player_2
	)
];

players_x = [players[0].x, players[1].x];
players_y = [players[0].y, players[1].y];

colors = [obj_player_1.color, obj_player_2.color];

seconds = 0;
alarm[0] = 60;
ready_text = ["3", "2", "1", "GO!"];

winner_triggered = false;
winner = 0;

end_game = false;

endCursor = [0, 0];
rematch = [false, false];

alarm[2] = 20 * 60;
audio_play_sound(sfx_matchstart, 0, false);

