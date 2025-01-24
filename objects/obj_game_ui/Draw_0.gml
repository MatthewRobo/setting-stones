/// @description Insert description here
// You can write your code in this editor

var _color = obj_game_manager.shrink ? #D100D1 : c_white;

draw_ring2(
	room_width / 2,
	room_height / 2,
	obj_game_manager.display_radius,
	100,
	360,
	1,
	0,
	_color,
	1,
	_color,
	0
);
