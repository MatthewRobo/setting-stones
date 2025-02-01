/// @description Insert description here
// You can write your code in this editor
if (countdown > 0) {
	if (countdown == 60 || countdown == 120 || countdown == 180) {
		audio_play_sound(sfx_countdown, 0, false);
	}
	countdown--;
} else {
	countup++;
	if (countdown == 0) {
		for (var i = 0; i < array_length(players); i++) {
			players[i].actionable = true;
		}
		audio_play_sound(sfx_matchgo, 0, false);
		audio_play_sound(sfx_go, 0, false);

		countdown--;
	}
}

if (global.hitstop > -1) {
	global.hitstop--;
}

opacity -= 1 / 45;
if (winner == 0) {}
if (winner > 0 && winner_triggered) {
	winner_triggered = false;
	alarm[1] = 120;
}

if (shrink && winner == 0) {
	radius -= shrink_radius;
}

//show_debug_message(alarm[2])
if (end_game) {
	var _rematch = true;
	for (var i = 0; i < 2; i++) {
		if (!rematch[i]) {
			//endCursor[i] += input_y("left", "right", "up", "down", i);

			if (input_check("down", i)) {
				endCursor[i] = end_options.EXIT;
			} else if (input_check("up", i)) {
				endCursor[i] = end_options.REMATCH;
			}

			_rematch = false;
		}
		//endCursor[i] = wrap(end_options.REMATCH, end_options.EXIT, endCursor[i]);

		if (input_check_pressed("accept", i)) {
			switch (endCursor[i]) {
				case end_options.REMATCH:
					rematch[i] = true;
					break;
				case end_options.EXIT:
					room_goto(menu);
					break;
			}
		}
	}
	if (_rematch) {
		room_restart();
	}
}

radius = clamp(radius, radius_minimum, radius_initial);
display_radius = min(radius, lerp(display_radius, radius, 0.2));
