var _wScalar = 16;
draw_primitive_begin(pr_trianglestrip);
for (var i = array_length(trail_points) - 1; i > 2; i--) {
	var _a0 = power((i - 2) / (array_length(trail_points) - 1), 2);
	if (i == array_length(trail_points) - 1) {
		_a0 = 0;
	}
	var _a1 = power((i - 3) / (array_length(trail_points) - 1), 2);

	var _p0 = trail_points[i];
	var _p1 = trail_points[i - 1];
	var _p2 = trail_points[i - 2];
	var _n0 = point_direction(_p0[0], _p0[1], _p1[0], _p1[1]) + 90;
	var _n1 = point_direction(_p1[0], _p1[1], _p2[0], _p2[1]) + 90;
	var _d0 = point_distance(_p0[0], _p0[1], _p1[0], _p1[1]);
	var _d1 = point_distance(_p1[0], _p1[1], _p2[0], _p2[1]);
	var _noise = random(max(heat - 50, 0) / 100);
	var _w0 = (power(_d0 / tapdash_speed, 2) + _noise) * _wScalar;
	var _w1 = (power(_d1 / tapdash_speed, 2) + _noise) * _wScalar;
	
	_w0 *= i / array_length(trail_points);
	_w1 *= (i - 1) / array_length(trail_points);
	
	_a1 = 1;
	_a0 = 1;
	//draw_vertex(_p0[0] + lengthdir_x(_w0, _n0), _p0[1] + lengthdir_y(_w0, _n0));
	//draw_vertex(_p0[0] - lengthdir_x(_w0, _n0), _p0[1] - lengthdir_y(_w0, _n0));
	//draw_vertex(_p1[0] + lengthdir_x(_w1, _n1), _p1[1] + lengthdir_y(_w1, _n1));
	//draw_vertex(_p1[0] - lengthdir_x(_w1, _n1), _p1[1] - lengthdir_y(_w1, _n1));
	
	var _colorSlow = color_slow;
	var _colorFast = color_fast;
	
	
	if (shield_active) {
		_colorSlow = color_guard;
		_colorFast = c_white;
	} else if (damage_mult >= 3) {
		_colorSlow = c_black;
		_colorFast = c_pink;
	} else if (damage_mult >= 2) {
		_colorSlow = c_pink;
		_colorFast = c_white;
	}
	
	var _c0 = merge_color(
		_colorSlow,
		_colorFast,
		power(clamp((_d0 - walk_speed) / (tapdash_speed - walk_speed), 0, 1), 2)
	);
	var _c1 = merge_color(
		_colorSlow,
		_colorFast,
		power(clamp((_d1 - walk_speed) / (tapdash_speed - walk_speed), 0, 1), 2)
	);

	if (heat > 100) {
		var _dx0 = lengthdir_x(2, _n0 - 90);
		var _dy0 = lengthdir_y(2, _n1 - 90);
		var _dy1 = lengthdir_y(2, _n1 - 90);
		var _dx1 = lengthdir_x(2, _n0 - 90);
		//
		//draw_vertex_color(_p0[0] + lengthdir_x(_w0, _n0) - _dx0, _p0[1] + lengthdir_y(_w0, _n0) - _dy0, _c0, _a0);
		//draw_vertex_color(_p0[0] - lengthdir_x(_w0, _n0) - _dx0, _p0[1] - lengthdir_y(_w0, _n0) - _dy0, _c0, _a0);
		//draw_vertex_color(_p1[0] + lengthdir_x(_w1, _n1) + _dx1, _p1[1] + lengthdir_y(_w1, _n1) + _dy1, _c1, _a1);
		//draw_vertex_color(_p1[0] - lengthdir_x(_w1, _n1) + _dx1, _p1[1] - lengthdir_y(_w1, _n1) + _dy1, _c1, _a1);

		draw_vertex_color(
			_p0[0]
				+ lengthdir_x(_w0, _n0)
				+ random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_p0[1]
				+ lengthdir_y(_w0, _n0)
				- random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_c0,
			_a0
		);
		draw_vertex_color(
			_p0[0]
				- lengthdir_x(_w0, _n0)
				- random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_p0[1]
				- lengthdir_y(_w0, _n0)
				- random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_c0,
			_a0
		);
		draw_vertex_color(
			_p1[0]
				+ lengthdir_x(_w1, _n1)
				+ random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_p1[1]
				+ lengthdir_y(_w1, _n1)
				+ random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_c1,
			_a1
		);
		draw_vertex_color(
			_p1[0]
				- lengthdir_x(_w1, _n1)
				+ random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_p1[1]
				- lengthdir_y(_w1, _n1)
				+ random_range(-(heat - 100) / 50, (heat - 100) / 50),
			_c1,
			_a1
		);
	} else {
		draw_vertex_color(
			_p0[0] + lengthdir_x(_w0, _n0),
			_p0[1] + lengthdir_y(_w0, _n0),
			_c0,
			_a0
		);
		draw_vertex_color(
			_p0[0] - lengthdir_x(_w0, _n0),
			_p0[1] - lengthdir_y(_w0, _n0),
			_c0,
			_a0
		);
		draw_vertex_color(
			_p1[0] + lengthdir_x(_w1, _n1),
			_p1[1] + lengthdir_y(_w1, _n1),
			_c1,
			_a1
		);
		draw_vertex_color(
			_p1[0] - lengthdir_x(_w1, _n1),
			_p1[1] - lengthdir_y(_w1, _n1),
			_c1,
			_a1
		);
	}
}

draw_primitive_end();