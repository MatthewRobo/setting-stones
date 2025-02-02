/// @description Insert description here
// You can write your code in this editor

var _width = display_get_gui_width();
var _height = display_get_gui_height();

var _hmid = _width / 2;
var _vmid = _height / 2;

var _colorBody = c_grey;
var _colorHeader = c_aqua;
var _colorHover = c_white;
var _colorActive = c_pink;

draw_set_halign(fa_center);

draw_set_alpha(opacity);
draw_set_color(c_white);
draw_set_font(fnt_inter_xlarge);
draw_set_valign(fa_middle);
//if (seconds < 4) {
//text_outline(750, 750, ready_text[seconds], 1, c_black, 8, 30, 100000);
//}
//
if (shrink && winner == 0) {
	text_outline(750, 750, "HURRY UP!", 1, c_black, 8, 30, 100000);
}

draw_set_alpha(1);
if (winner > 0) {
	if (winner == 3) {
		text_outline(750, 750, "DRAW", 1, c_black, 8, 30, 100000);
	} else {
		text_outline(
			750,
			750,
			"PLAYER " + string(winner) + " WINS!",
			1,
			c_black,
			8,
			30,
			100000
		);
	}
}

if (keyboard_check_pressed(vk_f4)) {
	room_goto(menu);
}

if (end_game) {
	draw_set_color(_colorBody);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_set_font(fnt_inter);
	draw_set_color(_colorHeader);
	draw_set_alpha(1);

	for (var i = 0; i < 2; i++) {
		var _xOffset = 0;
		switch (i) {
			case 0:
				_xOffset = -1;
				break;

			case 1:
				_xOffset = 1;
				break;
		}

		for (var j = 0; j < array_length(endDisplay); j++) {
			var _text = endDisplay[j];
			draw_set_color(_colorBody);

			if (j == endCursor[i]) {
				draw_set_color(_colorHover);
				if (rematch[i]) {
					draw_set_color(_colorActive);
				}
			}
			text_outline(
				_width * (0.5 + 0.25 * _xOffset),
				_height * (0.6 + 0.05 * j),
				_text,
				1,
				c_black,
				8,
				30,
				100000
			);
		}
	}
}
