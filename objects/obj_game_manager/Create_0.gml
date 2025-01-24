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
audio_play_sound(sfx_countdown, 0, false);

text_outline = function() {
	//x,y: Coordinates to draw
	//str: String to draw
	//arugment3 = outwidth: Width of outline in pixels
	//argument4 = outcol: Colour of outline (main text draws with regular set colour)
	//argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	//argument6 = separation, for the draw_text_EXT command.
	//argument7 = width for the draw_text_EXT command.

	//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
	var dto_dcol = draw_get_color();

	draw_set_color(argument4);

	for (var dto_i = 45; dto_i < 405; dto_i += 360 / argument5) {
		//draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
		draw_text_ext(
			argument0 + round(lengthdir_x(argument3, dto_i)),
			argument1 + round(lengthdir_y(argument3, dto_i)),
			argument2,
			argument6,
			argument7
		);
	}

	draw_set_color(dto_dcol);

	draw_text_ext(argument0, argument1, argument2, argument6, argument7);
};
