/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

draw_set_font(Font1);
draw_set_alpha(1);
draw_set_halign(fa_center);

draw_set_color(c_white);

if (keyboard_check_pressed(vk_f3)) {
	binded[0] = false;
	index[0] = 0;
	input_profile_reset_bindings("keyboard_and_mouse", 0);
	input_profile_reset_bindings("gamepad", 0);

	input_binding_scan_abort(0);
}

if (keyboard_check_pressed(vk_f4)) {
	input_binding_scan_abort(1);

	binded[1] = false;
	index[1] = 0;
	input_profile_reset_bindings("keyboard_and_mouse", 1);
	input_profile_reset_bindings("gamepad", 1);
	input_binding_scan_abort(1);
}

if (input_player_connected(0) && array_length(input_source_get_array(0)) > 0) {
	draw_text(750, 50, "Player 1 Connected");
	if (binded[0]) {
		draw_set_font(Font1_small);
		if (input_player_using_keyboard(0)) {
			draw_text(
				300,
				200,
				global._fhinputKeys[controls[0][0].__value]
					+ " - Up\n"
					+ global._fhinputKeys[controls[0][1].__value]
					+ " - Left\n"
					+ global._fhinputKeys[controls[0][2].__value]
					+ " - Down\n"
					+ global._fhinputKeys[controls[0][3].__value]
					+ " - Right\n"
			);
			draw_text(
				750,
				200,
				global._fhinputKeys[controls[0][4].__value]
					+ " - Summon Rock\n"
					+ global._fhinputKeys[controls[0][5].__value]
					+ " - Sonar Shot\n"
					+ global._fhinputKeys[controls[0][6].__value]
					+ " - Melee Attack"
			);
			draw_text(
				1200,
				200,
				global._fhinputKeys[controls[0][7].__value]
					+ " - Dash\n"
					+ global._fhinputKeys[controls[0][8].__value]
					+ " - Mass Summon\n"
					+ global._fhinputKeys[controls[0][9].__value]
					+ " - Defend"
			);
		}
		if (input_player_using_gamepad(0)) {
			draw_text(
				300,
				200,
				string_replace_all(controls[0][0], "gamepad", "")
					+ " - Up\n"
					+ string_replace_all(controls[0][1], "gamepad ", "")
					+ " - Left\n"
					+ string_replace_all(controls[0][2], "gamepad ", "")
					+ " - Down\n"
					+ string_replace_all(controls[0][3], "gamepad ", "")
					+ " - Right\n"
			);
			draw_text(
				750,
				200,
				string_replace_all(controls[0][4], "gamepad ", "")
					+ " - Summon Rock\n"
					+ string_replace_all(controls[0][5], "gamepad ", "")
					+ " - Sonar Shot\n"
					+ string_replace_all(controls[0][6], "gamepad ", "")
					+ " - Melee Attack"
			);
			draw_text(
				1200,
				200,
				string_replace_all(controls[0][7], "gamepad ", "")
					+ " - Dash\n"
					+ string_replace_all(controls[0][8], "gamepad ", "")
					+ " - Mass Summon\n"
					+ string_replace_all(controls[0][9], "gamepad ", "")
					+ " - Defend"
			);
		}

		draw_set_font(Font1);
		draw_text(750, 425, "Press f1 to disconnect player 1");
		draw_text(750, 500, "Press f3 to rebind controls");
		draw_text(750, 575, "Hold Summon to ready up");
		if (keyboard_check_pressed(vk_f1)) {
			binded[0] = false;
			index[0] = 0;
			input_profile_reset_bindings("keyboard_and_mouse", 0);
			input_profile_reset_bindings("gamepad", 0);
			input_player_ghost_set(true, 0);
			input_binding_scan_abort(0);
		}
		if (input_check_long("summon", 0)) {
			draw_text(750, 650, "READY!");
		}
	} else {
		draw_text(750, 400, "Press the " + verb_display[index[0]] + " button");
		if (new_binding[0]) {
			new_binding[0] = false;
			input_binding_scan_start(
				function(_new) {
					if (!binded[0]) {
						input_binding_set_safe(verbs[index[0]], _new, 0);
						new_binding[0] = true;

						index[0] += 1;
						if (index[0] == array_length(verbs)) {
							binded[0] = true;
						}
					}
				},
				function() {},
				0
			);
		}
	}
} else {
	draw_text(750, 50, "Waiting for Player 1");
}

if (input_player_connected(1) && array_length(input_source_get_array(1)) > 0) {
	draw_text(750, 800, "Player 2 Connected");
	if (binded[1]) {
		draw_set_font(Font1_small);
		if (input_player_using_keyboard(1)) {
			draw_text(
				300,
				950,
				global._fhinputKeys[controls[1][0].__value]
					+ " - Up\n"
					+ global._fhinputKeys[controls[1][1].__value]
					+ " - Left\n"
					+ global._fhinputKeys[controls[1][2].__value]
					+ " - Down\n"
					+ global._fhinputKeys[controls[1][3].__value]
					+ " - Right\n"
			);
			draw_text(
				750,
				950,
				global._fhinputKeys[controls[1][4].__value]
					+ " - Summon Rock\n"
					+ global._fhinputKeys[controls[1][5].__value]
					+ " - Sonar Shot\n"
					+ global._fhinputKeys[controls[1][6].__value]
					+ " - Melee Attack"
			);
			draw_text(
				1200,
				950,
				global._fhinputKeys[controls[1][7].__value]
					+ " - Dash\n"
					+ global._fhinputKeys[controls[1][8].__value]
					+ " - Mass Summon\n"
					+ global._fhinputKeys[controls[1][9].__value]
					+ " - Defend"
			);
		}
		if (input_player_using_gamepad(1)) {
			draw_text(
				300,
				950,
				string_replace_all(controls[1][0], "gamepad ", "")
					+ " - Up\n"
					+ string_replace_all(controls[1][1], "gamepad ", "")
					+ " - Left\n"
					+ string_replace_all(controls[1][2], "gamepad ", "")
					+ " - Down\n"
					+ string_replace_all(controls[1][3], "gamepad ", "")
					+ " - Right\n"
			);
			draw_text(
				750,
				950,
				string_replace_all(controls[1][4], "gamepad ", "")
					+ " - Summon Rock\n"
					+ string_replace_all(controls[1][5], "gamepad ", "")
					+ " - Sonar Shot\n"
					+ string_replace_all(controls[1][6], "gamepad ", "")
					+ " - Melee Attack"
			);
			draw_text(
				1200,
				950,
				string_replace_all(controls[1][7], "gamepad ", "")
					+ " - Dash\n"
					+ string_replace_all(controls[1][8], "gamepad ", "")
					+ " - Mass Summon\n"
					+ string_replace_all(controls[1][9], "gamepad ", "")
					+ " - Defend"
			);
		}
		draw_set_font(Font1);
		draw_text(750, 1175, "Press f2 to disconnect player 2");
		draw_text(750, 1250, "Press f4 to rebind controls");
		draw_text(750, 1325, "Hold Summon to ready up");
		if (keyboard_check_pressed(vk_f2)) {
			input_binding_scan_abort(1);

			binded[1] = false;
			index[1] = 0;
			input_profile_reset_bindings("keyboard_and_mouse", 1);
			input_profile_reset_bindings("gamepad", 1);
			input_binding_scan_abort(1);
		}

		if (input_check_long("summon", 1)) {
			draw_text(750, 1400, "READY!");
		}
	} else {
		draw_text(750, 1050, "Press the " + verb_display[index[1]] + " button");
		if (new_binding[1]) {
			new_binding[1] = false;
			input_binding_scan_start(
				function(_new) {
					if (!binded[1]) {
						input_binding_set_safe(verbs[index[1]], _new, 1);
						new_binding[1] = true;

						index[1] += 1;
						if (index[1] == array_length(verbs)) {
							binded[1] = true;
						}
					}
				},
				function() {},
				1
			);
		}
	}
} else {
	draw_text(750, 800, "Waiting for Player 2");
}

//If we get some new input from a source...
var _new = input_source_detect_new();
if (_new != undefined) {
	//And we don't already have a source assigned...
	if (array_length(input_source_get_array(0)) <= 0) {
		//Then set this new source as our current
		input_source_set(_new);
		input_player_ghost_set(false, 0);
	} else if (array_length(input_source_get_array(1)) <= 0) {
		//Then set this new source as our current
		input_source_set(_new);
		input_player_ghost_set(false, 0);
	}
}
