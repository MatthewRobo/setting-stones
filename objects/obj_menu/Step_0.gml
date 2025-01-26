/// @description Insert description here
// You can write your code in this editor
create_clouds();

if (keyboard_check_pressed(vk_f1)) {
	input_player_reset(0);
}

if (keyboard_check_pressed(vk_f2)) {
	input_player_reset(1);
}

lerpMainCursor = lerp(lerpMainCursor, mainCursor, menu_lerp_factor);
lerpMenuWidth = lerp(lerpMenuWidth, menuWidth, 0.2);

switch (menuState) {
	case menu_states.MAIN_MENU:
		for (var i = 0; i < INPUT_MAX_PLAYERS; i++) {
			if (input_check_pressed(["up", "down"], i)) {
				audio_play_sound(sfx_menuclick, 0, false);
				var _val = input_check_pressed("down", i) - input_check_pressed("up", i);
				mainCursor += _val;
			}
			if (input_check_pressed("accept", i)) {
				audio_play_sound(sfx_menuconfirm, 0, false);
				switch (mainCursor) {
					case main_options.CREDITS: 
						menuState = menu_states.CREDITS;
						break;
					case main_options.PLAY: 
						menuState = menu_states.CONTROLLER_ASSIGN;
						controllerAssign = [-1, -1];
						controllerAssignReady = [false, false];
						break;
					case main_options.EXIT:
						mainDisplay[main_options.EXIT] += "?";
						break;
				}
			}
			if (input_check_pressed("cancel", i)) {
				mainCursor = main_options.EXIT;
				audio_play_sound(sfx_menuback, 0, false);
			}
		}
		mainCursor = wrap(0, array_length(mainDisplay) - 1, mainCursor);
		break;
	case menu_states.CREDITS:
		for (var i = 0; i < INPUT_MAX_PLAYERS; i++) {
			if (input_check_pressed(["accept", "cancel"], i)) {
				menuState = menu_states.MAIN_MENU;
				audio_play_sound(sfx_menuback, 0, false);
				lerpMenuWidth = 0;
			}
		}
		break;
	case menu_states.CONTROLLER_ASSIGN:
		for (var i = 0; i < INPUT_MAX_PLAYERS; i++) {
			if (input_check_pressed("right", i)) {
				audio_play_sound(sfx_menuclick, 0, false);
				if (controllerAssign[0] == i) {
					controllerAssign[0] = -1;
					controllerAssignReady[0] = false;
				} else if (controllerAssign[1] != i) {
					controllerAssignReady[1] = false;
					controllerAssign[1] = i;
				}
			}

			if (input_check_pressed("left", i)) {
				audio_play_sound(sfx_menuclick, 0, false);
				if (controllerAssign[1] == i) {
					controllerAssign[1] = -1;
					controllerAssignReady[1] = false;
				} else if (controllerAssign[0] != i) {
					controllerAssignReady[0] = false;
					controllerAssign[0] = i;
				}
			}

			if (input_check_pressed("accept", i)) {
				for (var j = 0; j < array_length(controllerAssign); j++) {
					if (controllerAssign[j] == i) {
						controllerAssignReady[j] = true;
						audio_play_sound(sfx_menuconfirm, 0, false);
					}
				}
			}
			if (input_check_pressed("cancel", i)) {
				audio_play_sound(sfx_menuback, 0, false);
				var _isAssigned = true;
				for (var j = 0; j < array_length(controllerAssign); j++) {
					if (controllerAssign[j] == i) {
						_isAssigned = false;
						if (controllerAssignReady[j]) {
							controllerAssignReady[j] = false;
						} else {
							controllerAssign[j] = -1;
						}
					}
				}
				if (_isAssigned) { 
					menuState = menu_states.MAIN_MENU;
					lerpMenuWidth = 0;
				}
			}
		}
		var _assignReady = true;
		for (var i = 0; i < array_length(controllerAssignReady); i++) {
			if (!controllerAssignReady[i]) {
				_assignReady = false;
			}
		}
		if (_assignReady) {
			var _newSources = [2];
			for (var i = 0; i < array_length(controllerAssign); i++) {
				var _newSource = input_source_get_array(controllerAssign[i])[0];
				_newSources[i] = _newSource;
				//input_player_swap(i, controllerAssign[i]);
				inputLock[i] = inputLockTime;
			}

			for (var i = 0; i < array_length(_newSources); i++) {
				input_source_set(_newSources[i], i);
			}
			input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
			bindCursor = [controls_options.DONE, controls_options.DONE];
			menuState = menu_states.CONTROLLER_BINDING;
		}
		break;
	case menu_states.CONTROLLER_BINDING:
		var _bindReady = true;
		for (var i = 0; i < 2; i++) {
			var _bs = {
				player: i,
				rebind: function(_binding) {
					input_binding_set_safe(
						obj_menu.cursorVerb[self.player],
						_binding,
						self.player
					);
					obj_menu.bindCursor[self.player]++;
					obj_menu.inputLock[self.player] = inputLockTime;
					obj_menu.is_binding[self.player] = false;
				},
				abort: function(_result) {
					//show_debug_message(_result);
					obj_menu.is_binding[self.player] = false;
				},
			};

			cursorVerb[i] = "";
			//show_debug_message(cursorVerb);
			if (bindCursor[i] < controls_options.RESET) {
				cursorVerb[i] = verbs[bindCursor[i]];
			}

			if (inputLock[i] <= 0) {
				//show_debug_message(input_binding_scan_params_get(i));
				if (
					bindCursor[i] >= controls_options.SUMMON
					&& bindCursor[i] < controls_options.ACCEPT
				) {
					input_binding_scan_params_set(
						[
							input_binding_get("left", i).__value,
							input_binding_get("right", i).__value,
							input_binding_get("up", i).__value,
							input_binding_get("down", i).__value
						],
						,
						,
						i
					);

					if (!is_binding[i]) {
						is_binding[i] = true;
						input_binding_scan_start(_bs.rebind, _bs.abort, i);
					}
				} else {
					input_binding_scan_params_clear(i);
					if (!is_binding[i]) {
						if (input_check_pressed("cancel", i)) {
							if (bindReady[i]) {
								bindReady[i] = false;
							} else {
								for (var j = 0; j < 2; j++) {
									input_binding_scan_abort(j);
									controllerAssignReady[j] = false;
									bindReady[j] = false;
									controllerAssign[j] = j;
								}
								input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
								menuState = menu_states.CONTROLLER_ASSIGN;
							}
						} else if (input_check_pressed("accept", i)) {
							switch (bindCursor[i]) {
								case controls_options.DONE:
									bindReady[i] = true;
									break;
								case controls_options.RESET:
									input_profile_reset_bindings("keyboard_and_mouse", i);
									input_profile_reset_bindings("gamepad", i);
									break;
								default:
									input_binding_scan_start(_bs.rebind, _bs.abort, i);
							}
						}
					}
				}
				if (input_check_pressed(["up", "down"], i)) {
					input_binding_scan_abort(i);

					var _val =
						input_check_pressed("down", i) - input_check_pressed("up", i);
					bindCursor[i] += _val;
					bindCursor[i] = wrap(0, controls_options.DONE, bindCursor[i]);
					inputLock[i] = inputLockTime;
					bindReady[i] = false;
				}
			}

			for (var j = 0; j < array_length(verbDisplay); j++) {
				var _icon = "N/A";
				if (j < controls_options.RESET) {
					_icon = input_verb_get_icon(verbs[j], i);
				}
				//show_debug_message([i,  bindCursor[i] == j, verbDisplay[j], _icon]);
			}

			if (bindCursor[i] != controls_options.DONE) {
				bindReady[i] = false;
			}

			if (!bindReady[i]) {
				_bindReady = false;
			}
		}
		if (_bindReady) {
			room_goto(gameplay);
		}
		break;
}

for (var i = 0; i < 2; i++) {
	if (inputLock[i] > 0 && !input_binding_scan_in_progress(i)) {
		inputLock[i]--;
	}
}

//show_debug_message(["menuState", menuState]);
//show_debug_message(["controllerAssign", controllerAssign]);
//show_debug_message(["controllerAssignReady", controllerAssignReady]); 
