draw_set_font(Font1);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _width = display_get_gui_width();
var _height = display_get_gui_height();

var _hmid = _width / 2;
var _vmid = _height / 2;

var _colorBody = #aaaaaa;
var _colorHeader = #00c1dc;
var _colorHover = c_white;
var _colorActive = c_pink;

draw_set_color(_colorBody);

switch (menuState) {
	case menu_states.MAIN_MENU:
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(
			_hmid * (1 - 0.5 * lerpMenuWidth),
			0,
			_hmid * (1 + 0.5 * lerpMenuWidth),
			_height,
			false
		);
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_font(fnt_inter);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		var _yCursor = indexToCoord(lerpMainCursor, _height, menu_states.MAIN_MENU);
		draw_set_color(_colorActive);
		draw_rectangle(
			_hmid * (1 - 0.5 * lerpMenuWidth),
			_yCursor,
			_hmid * (1 + 0.5 * lerpMenuWidth),
			_yCursor + 58 + global.DEBUG_VALUE,
			false
		);
		for (var i = 0; i < array_length(mainDisplay); i++) {
			//draw_set_color(mainCursor == i ? _colorHover : _colorBody);
			var _y = indexToCoord(i, _height, menu_states.MAIN_MENU);

			draw_set_color(_colorHover);
			draw_text_ext(_hmid, _y, mainDisplay[i], 0, 9999);
			//text_outline(
			//50,
			//_height - 50 - (75 * array_length(mainDisplay)) + 75 * i,
			//mainDisplay[i],
			//3,
			//c_black,
			//8,
			//0,
			//100000
			//);
		}

		draw_sprite_ext(
			spr_logoBig,
			0,
			_hmid,
			_vmid * 0.75 + 10 * sin(global.ANIMATION_TIMER * 0.02),
			0.3,
			0.3,
			0,
			c_white,
			1
		);
		break;
	case menu_states.CREDITS:
		draw_set_font(Font2);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(_colorHover);
		text_outline(750, 150, "Credits", 8, c_black, 8, 30, 100000);
		draw_set_font(Font2_small);
		text_outline(750, 350, "Programming", 3, c_black, 8, 30, 100000);
		draw_set_font(Font1);
		text_outline(
			750,
			475,
			"Nick \"AqoursBaelz\" Pham\n\nMatthew \"M-AS\" Nguyen",
			3,
			c_black,
			8,
			30,
			100000
		);
		draw_set_font(Font2_small);
		text_outline(750, 600, "Music", 3, c_black, 8, 30, 100000);
		draw_set_font(Font1);
		text_outline(750, 700, "v1ris", 3, c_black, 8, 30, 100000);
		draw_set_font(Font2_small);
		text_outline(750, 850, "Special Thanks", 3, c_black, 8, 30, 100000);
		draw_set_font(Font1);
		draw_set_valign(fa_top);
		text_outline(
			750,
			950,
			"Marcos Felipe Wang\nKamron Farrokh\nThe SoCal Fighting Game Community",
			3,
			c_black,
			8,
			100,
			100000
		);
		break;
	case menu_states.CONTROLLER_ASSIGN:
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		draw_set_font(Font1);
		draw_set_color(_colorHeader);
		text_outline(_hmid, _height * 0.1, "Controllers", 3, c_black, 8, 30, 100000);
		for (var i = 0; i < array_length(controllerAssign); i++) {
			var _xOffset = 0;
			var _text = "";
			switch (i) {
				case 0:
					_xOffset = -1;
					_text = "Player 1";
					break;

				case 1:
					_xOffset = 1;
					_text = "Player 2";
					break;
			}
			text_outline(
				_width * (0.5 + 0.25 * _xOffset),
				_height * 0.1,
				_text,
				3,
				c_black,
				8,
				30,
				100000
			);
		}
		for (var i = 0; i < INPUT_MAX_PLAYERS; i++) {
			var _xOffset = 0;
			if (array_length(input_source_get_array(i)) > 0) {
				draw_set_color(_colorHover);
			} else {
				draw_set_color(_colorBody);
			}
			if (controllerAssign[0] == i) {
				if (controllerAssignReady[0]) {
					draw_set_color(_colorActive);
				}
				_xOffset = -1;
			} else if (controllerAssign[1] == i) {
				if (controllerAssignReady[1]) {
					draw_set_color(_colorActive);
				}
				_xOffset = 1;
			}
			text_outline(
				_width * (0.5 + 0.25 * _xOffset),
				_height * (0.2 + 0.1 * i),
				input_source_get_array(i),
				3,
				c_black,
				8,
				30,
				100000
			);
		}

		break;

	case menu_states.CONTROLLER_BINDING:
		draw_set_font(Font1);
		draw_set_valign(fa_top);
		var _lineHeight =
			string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijlkmnopqrstuvwxyz.;,<")
			* 1.1;
		var _xOffset = 0.03;
		for (var i = 0; i < 2; i++) {
			var _xMultLeft = (i == 0) ? 0 + _xOffset : 0.5 + _xOffset / 2;
			var _xMultRight = (i == 0) ? 0.5 - _xOffset / 2 : 1 - _xOffset;
			for (var j = 0; j < array_length(verbDisplay); j++) {
				draw_set_halign(fa_left);

				var _text = verbDisplay[j];
				draw_set_color(_colorBody);
				var _alpha = 1;
				draw_set_alpha(_alpha);

				if (j == bindCursor[i]) {
					draw_set_color(_colorHover);
					if (input_binding_scan_in_progress(i)) {
						draw_set_color(_colorActive);
						_alpha = abs(
							lengthdir_x(1, input_binding_scan_time_remaining(i) * 0.4)
						);
					}
				}
				if (bindReady[i]) {
					draw_set_color(_colorActive);
				}

				text_outline(
					_width * _xMultLeft,
					_height * 0.2 + _lineHeight * j,
					_text,
					3,
					c_black,
					8,
					30,
					100000
				);
				if (j < controls_options.RESET) {
					draw_set_halign(fa_right);
					draw_set_alpha(_alpha);
					text_outline(
						_width * _xMultRight,
						_height * 0.2 + _lineHeight * j,
						input_verb_get_icon(verbs[j], i),
						3,
						c_black,
						8,
						30,
						100000
					);
				}
			}
		}
		break;
}
