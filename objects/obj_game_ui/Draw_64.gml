/// @description Insert description here
// You can write your code in this editor

var _hMid = display_get_gui_width() / 2;
var _guiHeight = display_get_gui_height();
var _guiWidth = display_get_gui_width();

var _colors = [c_aqua, c_orange];
//p1 hp bar

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_inter_header);

if (instance_exists(obj_game_manager)) {
	var _gm = obj_game_manager;
	var _radMax = 64;
	var _radDiff = 4;
	var _timer = _gm.alarm[2];
	var _rad = _gm.display_radius * (_radMax - (2 * _radDiff)) / _gm.radius_initial;
	var _radIn = _rad - _rad * (_timer / (60 * 15));
	//var _vMid = 68;
	var _vMid = _guiHeight * 0.06;
	var _mapScale = _radMax / _gm.radius_initial;
	var _xAlign = _hMid - _radMax - 16;
	var _yAlign = _vMid - _radMax - 16;
	var _pxs = [_hMid, _hMid];
	var _pys = [_vMid, _vMid];

	for (var i = 0; i < array_length(players); i++) {
		var playersExist = true;
		if (instance_exists(players[i])) {
			_pxs[i] = _xAlign + players[i].x * _mapScale;
			_pys[i] = _yAlign + players[i].y * _mapScale;
		}
	}

	draw_set_alpha(0.25);
	draw_set_color(c_white);
	draw_circle(_hMid, _vMid, _radMax, false);
	draw_set_alpha(1);

	draw_set_color(c_aqua);
	draw_primitive_begin(pr_trianglestrip);
	for (var i = player_angle - 180 - 45; i < player_angle - 180 + 45; i++) {
		draw_vertex(_pxs[0], _pys[0]);
		draw_vertex(_hMid + lengthdir_x(_radMax, i), _vMid + lengthdir_y(_radMax, i));
	}
	//draw_vertex(_hMid, _vMid);
	draw_primitive_end();

	draw_set_color(c_orange);
	draw_primitive_begin(pr_trianglestrip);
	for (var i = player_angle - 45; i < player_angle + 45; i++) {
		draw_vertex(_pxs[1], _pys[1]);
		draw_vertex(_hMid + lengthdir_x(_radMax, i), _vMid + lengthdir_y(_radMax, i));
	}
	//draw_vertex(_hMid, _vMid);
	draw_primitive_end();

	draw_set_color(c_white);
	if (_gm.shrink) {
		draw_set_color(c_fuchsia);
	}
	draw_circle(_hMid, _vMid, _rad + _radDiff, false);
	draw_set_color(c_black);
	draw_circle(_hMid, _vMid, _radIn, false);
	draw_set_alpha(1);
	if (instance_exists(obj_player_1)) {
		draw_set_color(#0080ff);
		draw_circle(
			_xAlign + obj_player_1.x * _mapScale,
			_yAlign + obj_player_1.y * _mapScale,
			5,
			false
		);
		draw_set_color(c_white);
		draw_circle(
			_xAlign + obj_player_1.x * _mapScale,
			_yAlign + obj_player_1.y * _mapScale,
			2,
			false
		);
	}

	if (instance_exists(obj_player_2)) {
		draw_set_color(c_red);
		draw_circle(
			_xAlign + obj_player_2.x * _mapScale,
			_yAlign + obj_player_2.y * _mapScale,
			5,
			false
		);
		draw_set_color(c_white);
		draw_circle(
			_xAlign + obj_player_2.x * _mapScale,
			_yAlign + obj_player_2.y * _mapScale,
			2,
			false
		);
	}

	if (global.MAP_ROCKS) {
		draw_set_color(c_gray);
		for (var i = 0; i < instance_number(obj_projectile); ++i) {
			var _rock = instance_find(obj_projectile, i);
			var _player = instance_nearest(_rock.x, _rock.y, obj_actor);
			draw_set_alpha(
				sin(
					_timer / 60
						+ point_distance(_rock.x, _rock.y, _player.x, _player.y) / 500
				)
			);
			draw_circle(
				_xAlign + _rock.x * _mapScale,
				_yAlign + _rock.y * _mapScale,
				2,
				false
			);
		}
	}
}

draw_set_color(c_black);
var _meterXOffset = 0.1;
var _hpXOffset = 0.1;
var _heatXOffset = 0.9;
var _scoreXOffset = 0.06;

//draw_line_width(0, 0, 100, 100, 15);

for (var i = 0; i < array_length(players); i++) {
	if (!surface_exists(hud_surfaces[i])) {
		hud_surfaces[i] = surface_create(
			display_get_gui_width(),
			display_get_gui_height()
		);
	}

	draw_set_alpha(1);
	var _alpha = 1;
	var _sign = i == 0 ? -1 : 1;

	surface_set_target(hud_surfaces[i]);
	draw_clear_alpha(c_black, 0);

	for (var j = 0; j < 4; j++) {
		var _x = _hMid * (1 + _sign * _heatXOffset);
		var _y = _guiHeight * 0.06;
		var _outline = 0;
		var _color = _colors[i];
		var _radius = 50;
		switch (j) {
			case 0:
				_outline = 12;
				_color = c_white;
				break;
			case 1:
				_outline = 9;
				_color = c_black;
				break;
			case 2:
				_outline = 4;
				_color = c_black;
				break;
			case 3:
				_color = c_black;
				break;
		}
		draw_set_color(_color);
		if (j < 2) {
			draw_circle(_x, _y, 50 + _outline, false);
		}

		if (j == 2) {
			draw_ring2(
				_x,
				_y,
				_radius,
				-_outline,
				24,
				0.5,
				0,
				c_red,
				_alpha,
				c_red,
				_alpha
			);
			//draw_ring2(_x, _y, _radius, -_outline - (_radius - _outline) * (lerp_heats[i] / 100), 24, 0.5, 0, c_red, _alpha, c_red, _alpha);
			draw_ring2(
				_x,
				_y,
				_radius,
				-_outline,
				24,
				0.5,
				180,
				c_white,
				_alpha,
				c_white,
				_alpha
			);
		}

		if (j == 3) {
			_outline = 6;
			//for (var k = -1; k <= 1; k += 1) {
			//draw_line_width(_x, _y, _x + _sign * lengthdir_x(_radius + _outline, k * 45), _y + lengthdir_y(_radius + _outline, k * 45), k == 0 ? 4 : 8);
			//}

			var _direction = lerp_heats[i] / 200 * 90 - 45;
			var _length = 52;
			var _x0 = _x + _sign * lengthdir_x(_length, _direction);
			var _y0 = _y + lengthdir_y(_length, _direction);

			var _lengthStamina = _length * (1 - lerp_staminas[i] / stamina_max);
			var _x1 = _x + _sign * lengthdir_x(_lengthStamina, _direction);
			var _y1 = _y + lengthdir_y(_lengthStamina, _direction);

			draw_set_color(c_white);

			var _needleRadius = 3;
			var _x00 = _x + lengthdir_x(_needleRadius, _direction + _sign * 90);
			var _x01 = _x + lengthdir_x(_needleRadius, _direction - _sign * 90);

			var _y00 = _y + lengthdir_y(_needleRadius, _direction + 90);
			var _y01 = _y + lengthdir_y(_needleRadius, _direction - 90);

			draw_circle(_x, _y, 4, false);
			//draw_line_width(_x, _y, _x0, _y0, 4);
			draw_primitive_begin(pr_trianglestrip);
			draw_vertex(_x00, _y00);
			draw_vertex(_x0, _y0);
			draw_vertex(_x01, _y01);
			draw_primitive_end();
			draw_circle(_x1, _y1, 4, false);
			draw_set_color(c_black);
			draw_circle(_x1, _y1, 2, false);
		}
	}

	for (var j = 0; j < 5; j++) {
		var _color = _colors[i];

		var _x = _hMid * (1 + _sign * _meterXOffset);
		var _y = _guiHeight * 0.065;
		var _span = 39.3;
		var _wid = _span - 4;

		var _div = 5;
		var _loopLength = meter_max / _div;
		var _angle = 315;
		var _spent = lerp_meters[i] >= meters[i];
		var _outline = 0;
		switch (j) {
			case 0:
				_outline = 8;
				_y += 7;
				break;
			case 1:
				_color = c_white;
				_outline = 8;
				break;
			case 2:
				_color = c_black;
				_outline = 5;
				break;
			case 3:
				_color = c_white;
				_loopLength = _spent ? lerp_meters[i] / _div : meters[i] / _div;
				break;
			case 4:
				if (meters[i] >= supercosts[i]) {
					_color = #ffcc00;
				} else if (meters[i] >= fd_cost) {
					_color = #1dd01e;
				} else {
					_color = #5553d3;
				}
				_loopLength = _spent ? meters[i] / _div : lerp_meters[i] / _div;
				break;
		}
		for (var k = 0; k < _loopLength; k++) {
			var _len = 1;
			var _rumble = 0;
			draw_set_color(_color);
			var _overflow = 0;

			if (meters[i] >= meter_max) {
				_overflow = clamp(
					0.5 + 0.5 * sin(k * 0.5 + global.ANIMATION_TIMER * -0.1),
					0,
					1
				);
				//_overflow = abs((-global.ANIMATION_TIMER / 60 + k / 10) % 1);
			}

			if (j >= 3) {
				_len = k >= floor(_loopLength) ? _loopLength % 1 : 1;
				_color = merge_color(c_white, _color, _len);
				if (j >= 4) {
					draw_set_color(merge_color(_color, c_white, _overflow));
				}
			}

			if (k >= supercosts[i] / _div) {
				var _lenExtra = 20 * clamp(k - (lerp_supercosts[i] / _div) + 1, 0, 1);
				_len *= 60 + _lenExtra;
			} else if (k >= fd_cost / _div) {
				_len *= 60;
			} else {
				_len *= 40;
			}

			_len += _overflow * 10;

			//var _yStagger = global.DEBUG_VALUE * k;
			var _yStagger = 0;
			var _x1 = _x + _sign * _span * k;
			var _x2 = _x1 + _sign * lengthdir_x(_len, _angle);
			var _y2 = _y + _yStagger + lengthdir_y(_len, _angle);
			var _y1 = _y + _yStagger;
			draw_primitive_begin(pr_trianglestrip);
			var _outlineB = _outline * 1;
			//var _outlineB = _outline * 1 + _overflow * 4;

			var _outlineA = _outlineB * 3;
			var _outlineC = _outlineB;
			draw_vertex(_x1 - _sign * _outlineA, _y1 - _outlineB);
			draw_vertex(_x2 - _sign * _outlineB, _y2 + _outlineB);
			draw_vertex(_x1 + _sign * (_wid + _outlineB), _y1 - _outlineB);
			draw_vertex(_x2 + _sign * (_wid + _outlineA), _y2 + _outlineB);
			draw_primitive_end();
		}
	}

	for (var j = 0; j < 4; j++) {
		var _color = _colors[i];

		var _x = _hMid * (1 + _sign * _hpXOffset);
		var _y = _guiHeight * 0.055;
		var _wid = 70.8;
		var _span = _wid + 8;
		var _div = 1;
		var _loopLength = max_hp / _div;
		var _thickness = 8;
		var _slant = _thickness;
		var _spent = lerp_hps[i] >= hps[i];
		var _outline = 0;
		switch (j) {
			case 0:
				draw_set_color(c_white);
				_outline = 8;
				break;
			case 1:
				draw_set_color(c_black);
				_outline = 5;
				break;
			case 2:
				draw_set_color(c_red);
				_loopLength = _spent ? lerp_hps[i] / _div : hps[i] / _div;
				break;
			case 3:
				var _hpColor = c_white;
				if (instance_exists(players[i])) {
					_hpColor = merge_color(
						c_white,
						c_fuchsia,
						clamp((players[i].heat - 50) / 50, 0, 1)
					);
				}
				if (!hittables[i]) {
					_hpColor = merge_color(_hpColor, c_black, 0.5);
				}
				draw_set_color(_hpColor);
				_loopLength = _spent ? hps[i] / _div : lerp_hps[i] / _div;
				break;
		}
		var _heatString = "";

		for (var k = 0; k < _loopLength; k++) {
			var _len = 1;
			var _rumble = 0;
			if (j >= 2) {
				_len = k >= floor(_loopLength) ? _loopLength % 1 : 1;

				if (instance_exists(players[i])) {
					_rumble = power(players[i].damage_mult - 1, 2) * 5;
					draw_set_alpha(1 - random((players[i].damage_mult - 1)));
					switch(players[i].damage_mult) {
						case 2: _heatString = "OVERHEAT!"; break;
						case 3: _heatString = "FATAL HEAT!!"; break;
					}
				}
			}
			//if (k >= supercosts[i] / _div) {
			//_len *= 80;
			//} else if (k >= fd_cost / _div) {
			//_len *= 60;
			//} else {
			//_len *= 40;
			//}
			_thickness = 16 + 4 * k;
			//_thickness += sin(0.06 * global.ANIMATION_TIMER + 0.3 * k) * 4;

			//var _yStagger = global.DEBUG_VALUE * k;
			var _yStagger = 0;

			_slant = _thickness;
			var _x1 = _x + _sign * _span * k;
			var _x2 = _x1 + _sign * _wid * _len;
			var _y2 = _y + _yStagger;
			var _y1 = _y + _yStagger;
			draw_primitive_begin(pr_trianglestrip);
			var _outlineB = _outline * 3;

			var _outlineA = _outline * 1;

			//draw_vertex(_x1 - _sign * (-_slant + _outlineA), _y1 - _outline - _thickness);
			//draw_vertex(_x1 - _sign * _outlineB, _y1 + _outline );
			//draw_vertex(_x2 + _sign * (_slant + _outlineB), _y2 - _outline - _thickness);
			//draw_vertex(_x2 + _sign * (_outlineA) , _y2 + _outline );
			draw_vertex(
				_x1 - _sign * (-_slant + _outlineA) + random_range(-_rumble, _rumble),
				_y1 - _outline - _thickness + random_range(-_rumble, _rumble)
			);
			draw_vertex(
				_x1 - _sign * _outlineB + random_range(-_rumble, _rumble),
				_y1 + _outline + random_range(-_rumble, _rumble)
			);
			draw_vertex(
				_x2 + _sign * (_slant + _outlineB) + random_range(-_rumble, _rumble),
				_y2 - _outline - _thickness + random_range(-_rumble, _rumble)
			);
			draw_vertex(
				_x2 + _sign * _outlineA + random_range(-_rumble, _rumble),
				_y2 + _outline + random_range(-_rumble, _rumble)
			);
			draw_primitive_end();
		}

		if (_sign == -1) {
			var _reverse = "";
			for(var ci = string_length(_heatString); ci > 0; ci--) {
				_reverse += string_char_at(_heatString, ci);
			}
			_heatString = _reverse;
		}
		
		draw_set_alpha(1);
		for (var k = 0; k < string_length(_heatString); k++) {
			var _rumble = players[i].damage_mult * 5;
			draw_set_alpha(1 - random((players[i].damage_mult - 1)));
			draw_set_color(merge_color(c_red, c_white, random(1)));
			var _x1 = _hMid * (1 + _sign * (0.2)) + _sign * (58 * k);
			draw_text(_x1 + random_range(-_rumble, _rumble), _guiHeight * 0.06 + random_range(-_rumble, _rumble), string_char_at(_heatString, k + 1));
		}
		
		draw_set_font(fnt_inter_small);

		draw_set_color(c_white);
		draw_set_valign(fa_bottom);
		_y = _guiHeight * 0.03;

		var _totalGames = global.SCORES[0] + global.SCORES[1];
			_x = _hMid * (1 + _sign * _scoreXOffset);
			//_y = 0;
			

			var _scoreString = $"[ {global.SCORES[i]}/{_totalGames} ]";
			var _streakString = global.STREAK[i] > 0 ? $"{global.STREAK[i]} STREAK" : "";

			//if (global.STREAK[i] > 0) {
				if (_sign == -1) {
					draw_set_halign(fa_right);
					_scoreString = $"{_streakString} {_scoreString}";
				} else {
					draw_set_halign(fa_left);
					_scoreString = $"{_scoreString} {_streakString}";
				}
			//}
			text_outline(_x, _y, _scoreString, 3, c_black, 8, 30, 100000);
	}

	surface_reset_target();
	draw_set_alpha(alpha[i]);
	draw_surface(hud_surfaces[i], 0, 0);

	//_x = _hMid * (1 + _sign * _heatXOffset);
	//_y = _guiHeight * 0.06;
	//_wid = 2;
	//_loopLength = heats[i];
	//
	//draw_set_alpha(1);
	//
	//var _outline = 8;
	//
	//draw_ring2(_x - _outline * _sign / 2, _y, 0, 50 + _outline * 2, 24, 0.25, 45 + _sign * 90, _colors[i], 1, _colors[i], 1);
	//_outline = 8;
	//draw_ring2(_x - _outline * _sign / 2, _y, 0, 50 + _outline * 1.5, 24, 0.25, 45 + _sign * 90, c_black, 1, c_black, 1);
	////draw_ring2(_x, _y, 50, -2, 24, .25, 45 + _sign * 90, c_white, 1, c_white, 1);
	//draw_ring2(_x + _outline * _sign / 2, _y, 40, 4, 24, 0.25, 45 + _sign * 90, c_white, 1, c_white, 1);
	//draw_ring2(_x + _outline * _sign / 2, _y, 40, 4, 24, 0.125, _sign * 45 * 1.5 + 45 * 1.5, c_red, 1, c_red, 1);
	//
	//draw_set_color(c_black);
	//draw_line_width(_x, _y, _x + 50 * _sign, _y, 4);
	//
	//_loopLength = lerp_heats[i];
	//
	//draw_set_color(c_white);
	//
	//var _anglePercent = _loopLength / 200;
	//var _direction = _anglePercent * 90 - 45;
	//var _x0 = _x + _outline * _sign / 2;
	//var _y0 = _y;
	//
	//var _x1 = _x0 + _sign * lengthdir_x(50, _direction);
	//var _y1 = _y0 + lengthdir_y(50, _direction);
	//
	//draw_set_color(c_white);
	//draw_line_width(_x0, _y0, _x1, _y1, 3);
}
