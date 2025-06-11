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

if (obj_game_manager.countdown > 0) {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	var _length = 2000;
	var _radius = power(obj_game_manager.countdown, 2) / 100;
	var _direction = player_angle + 90;

	var _dx = lengthdir_x(_length, _direction);
	var _dy = lengthdir_y(_length, _direction);
	draw_line_width(
		midpoint[0] - _dx,
		midpoint[1] - _dy,
		midpoint[0] + _dx,
		midpoint[1] + _dy,
		_radius
	);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_set_font(fnt_inter);
	//text_outline(midpoint[0], midpoint[1], "SET YOUR STONES", 2, c_black, 4, 20, 500);
	draw_text(midpoint[0], midpoint[1], "SET YOUR STONES");
} else if (obj_game_manager.countup < 60) {
	var _percent = 1 - obj_game_manager.countup / 60;
	draw_set_color(c_black);
	draw_set_alpha(_percent / 2);
	//draw_rectangle(lerp(midpoint[0], obj_cam_ctrl.cam_left, _percent), midpoint[1] - 50, lerp(midpoint[0], obj_cam_ctrl.cam_right, _percent), midpoint[1] + 50, false);
	var _powcent = power(_percent, 2);
	draw_rectangle(
		lerp(obj_cam_ctrl.cam_right, midpoint[0], _powcent),
		midpoint[1] - 50,
		obj_cam_ctrl.cam_right,
		midpoint[1] + 50,
		false
	);
	draw_rectangle(
		obj_cam_ctrl.cam_left,
		midpoint[1] - 50,
		lerp(obj_cam_ctrl.cam_left, midpoint[0], _powcent),
		midpoint[1] + 50,
		false
	);

	draw_set_font(fnt_inter_header);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_pink);
	draw_set_alpha(_percent);

	draw_text(midpoint[0], midpoint[1], "SEND 'EM");
}
