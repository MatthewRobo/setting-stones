/// @description Insert description here
// You can write your code in this editor

var _hMid = display_get_gui_width()/2;
var _guiHeight = display_get_gui_height();
var _guiWidth = display_get_gui_width();


var _colors = [c_aqua, c_orange];
//p1 hp bar



if(instance_exists(obj_game_manager)) {
	var _gm = obj_game_manager;
	var _radMax = 64;
	var _radDiff = 4;
	var _timer = _gm.alarm[2];
	var _rad = _gm.display_radius * (_radMax - (2 * _radDiff)) / _gm.radius_initial;
	var _radIn = _rad - _rad * (_timer / (60*15));
	//var _vMid = 68;
	var _vMid = _guiHeight * 0.06;
	var _mapScale= _radMax / _gm.radius_initial;
	var _xAlign = _hMid - _radMax - 16;
	var _yAlign = _vMid - _radMax - 16;
	var _pxs = [_hMid, _hMid];
	var _pys = [_vMid, _vMid] ;

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
	for (var i = player_angle  - 45; i < player_angle + 45; i++) {
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
		draw_circle(_xAlign + obj_player_1.x * _mapScale, _yAlign + obj_player_1.y * _mapScale, 5, false); 
		draw_set_color(c_white);
				draw_circle(_xAlign + obj_player_1.x * _mapScale, _yAlign + obj_player_1.y * _mapScale, 2, false); 
	}
	
	if (instance_exists(obj_player_2)) {
		draw_set_color(c_red);
		draw_circle(_xAlign + obj_player_2.x * _mapScale, _yAlign + obj_player_2.y * _mapScale, 5, false);
				draw_set_color(c_white);
				draw_circle(_xAlign + obj_player_2.x * _mapScale, _yAlign + obj_player_2.y * _mapScale, 2, false);
	}
	
	if (global.MAP_ROCKS) {
		draw_set_color(c_gray);
		for (var i = 0; i < instance_number(obj_projectile); ++i;)
		{
			var _rock = instance_find(obj_projectile,i);
			var _player = instance_nearest(_rock.x, _rock.y, obj_actor);
			draw_set_alpha(sin(_timer / 60 + point_distance(_rock.x, _rock.y, _player.x, _player.y)  / 500))
			draw_circle(_xAlign + _rock.x * _mapScale, _yAlign + _rock.y * _mapScale, 2, false);
		}
	}
	
	
} 

draw_set_color(c_black);
var _meterXOffset = 0.1;
var _hpXOffset = 0.1;
for (var i = 0; i < array_length(players); i++) {
	draw_set_alpha(alpha[i]);
	var _sign = i == 0 ? -1 : 1;
	var _x = _hMid * (1 + _sign * _meterXOffset);
	var _y = _guiHeight * 0.065;
	var _wid = 26;
	var _span = 30;
	var _div = 5;
	var _loopLength = meter_max / _div;
	var _angle = 315;
	var _spent = lerp_meters[i] >= meters[i];
	var _color = _colors[i]
	for (var j = 0; j < 4; j++) {
		var _outline = 0;
		switch (j) {
			case 0:
				_outline = 8;
				break;
			case 1:
				_color = c_black;
				_outline = 4;
				break;
			case 2:
				_color = c_white;
				_loopLength = _spent ? lerp_meters[i] / _div : meters[i] / _div ;
				break;
			case 3:
				if(meters[i] >= supercosts[i]) {
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
				_overflow =  clamp(0.5 + 0.5 * sin(k * 0.5 + global.ANIMATION_TIMER * -0.1), 0, 1);
				//_overflow = abs((-global.ANIMATION_TIMER / 60 + k / 10) % 1);
			}
			
			if (j >= 2) {
				_len = k >= floor(_loopLength) ? _loopLength mod 1 : 1;
				_color = merge_color(c_white, _color, _len);
				if (j >= 3) {
					draw_set_color(merge_color(_color, c_white, _overflow));
				}
			}
			


			
			if (k >= supercosts[i] / _div) {
				_len *= 80;
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
	
	_x = _hMid * (1 + _sign * _hpXOffset);
	_y = _guiHeight * 0.055;
	_wid = 52;
	_span = _wid +8;
	_div = 1;
	_loopLength = max_hp / _div;
	var _thickness = 8;
	var _slant = _thickness;
	_spent = lerp_hps[i] >= hps[i];
	for (var j = 0; j < 4; j++) {
		var _outline = 0;
		switch (j) {
			case 0:
				draw_set_color(_colors[i]);
				_outline = 8;
				break;
			case 1:
				draw_set_color(c_black);
				_outline = 4;
				break;
			case 2:
				draw_set_color(c_red);
				_loopLength = _spent ? lerp_hps[i] / _div : hps[i] / _div ;
				break;
			case 3:
				draw_set_color(hittables[i] ? c_white : c_grey);
				_loopLength = _spent ? hps[i] / _div : lerp_hps[i] / _div;
				break;
		}
		for (var k = 0; k < _loopLength; k++) {
			var _len = 1;
			var _rumble = 0;

			if (j >= 2) {
				_len = k >= floor(_loopLength) ? _loopLength mod 1 : 1;
				
				if (instance_exists(players[i])) {
					_rumble = (players[i].damage_mult - 1) * 5;
					draw_set_alpha((1 - random((players[i].damage_mult - 1))) * alpha[i]);
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
			draw_vertex(_x1 - _sign * (-_slant + _outlineA)  + random_range(-_rumble, _rumble), _y1 - _outline - _thickness  + random_range(-_rumble, _rumble));
			draw_vertex(_x1 - _sign * _outlineB  + random_range(-_rumble, _rumble), _y1 + _outline  + random_range(-_rumble, _rumble));
			draw_vertex(_x2 + _sign * (_slant + _outlineB)  + random_range(-_rumble, _rumble), _y2 - _outline - _thickness  + random_range(-_rumble, _rumble));
			draw_vertex(_x2 + _sign * (_outlineA)  + random_range(-_rumble, _rumble), _y2 + _outline  + random_range(-_rumble, _rumble));
			draw_primitive_end();
			
		}
	}
}
