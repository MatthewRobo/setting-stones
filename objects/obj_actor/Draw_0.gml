/// @description Insert description here
// You can write your code in this editor

#macro color_guard #AFE1AF

var _radius = sprite_width / 2;

//draw_set_alpha(alarm[1] > 0 ? alarm[1] % 2 : 1 );
//draw_set_color(c_white);
//draw_circle(x, y, _radius + 7, false);
//draw_set_color(c_black);
//draw_circle(x, y, _radius + 4, false);
//draw_set_color(alarm[1] > 0 && alarm[1] % 2 ? c_white : color);
//draw_circle(x, y, _radius,     false);

var _color2 = color_guard;

if (was_hit) {
	draw_set_color(color);
	draw_set_alpha(1);
	var _len = 40;
	draw_line_width(x - _len, y - _len, x + _len, y + _len, 16);
	draw_line_width(x - _len, y + _len, x + _len, y - _len, 16);
}

draw_set_alpha(0.7);
if (shield_active) {
	draw_ring2(x, y, 0, 100, 24, 1, 0, c_white, 0.2, color_guard, 1);
}

//draw_sprite_ext(Sprite1,0,x,y,1,1,0,color,1)

draw_set_alpha(0.3);

draw_set_color(
	merge_color(
		stamina_color,
		c_pink,
		clamp(stamina_warning / stamina_warning_duration, 0, 1)
	)
);

var _angle_plus = 0;
//var _angle_plus = 3/360;
var _stamina_limit = stamina_limit / stamina_max + _angle_plus;
var _stamina_current = stamina / stamina_max;

var _lerp_stamina_limit = anim_stamina_limit / stamina_max + _angle_plus;
var _stamina_limit_angle = 360 * _stamina_limit;

var _lerp_stamina_limit_angle = 360 * _lerp_stamina_limit;

var _lerp_stamina_current = min(lerp_stamina / stamina_max, _lerp_stamina_limit);

//draw_ring2(
	//x,
	//y,
	//100,
	//10,
	//360,
	//_lerp_stamina_current,
	//0,
	//draw_get_color(),
	//0.3,
	//draw_get_color(),
	//0.3
//);
draw_ring2(
	x,
	y,
	103,
	4,
	360,
	_lerp_stamina_current,
	0,
	c_white,
	1,
	c_white,
	1
);
draw_circle_width(95, 5, 360, _stamina_limit);
draw_circle_width(110, 5, 360, _stamina_limit);
//draw_circle_width(100, 10, 360, _stamina_limit);

var _gradient = clamp((min(heat, lerp_heat) - 100) / 10, 0, 1);

draw_set_alpha(1);
draw_circle_width(100, 10, 360, stamina / stamina_max);

var _staminaRecoverColor = c_white;
if (stamina_warning > 0) {
	_staminaRecoverColor = merge_color(
		_staminaRecoverColor,
		c_pink,
		stamina_warning / stamina_warning_duration
	);
}

draw_ring2(
	x,
	y,
	95,
	5,
	360,
	alarm[2] / 360,
	stamina / stamina_max * 360,
	_staminaRecoverColor,
	1,
	_staminaRecoverColor,
	1
);
draw_ring2(
	x,
	y,
	110,
	5,
	360,
	alarm[2] / 360,
	stamina / stamina_max * 360,
	_staminaRecoverColor,
	1,
	_staminaRecoverColor,
	1
);

if (shooting > 0) {
	//draw_set_alpha(0.5);
	//draw_circle_width_shoot(shoot_radius,10, 360)
	var _ringThick = shoot_radius * 0.2;
	draw_ring2(
		x,
		y,
		shoot_radius - _ringThick,
		_ringThick,
		360,
		1,
		0,
		color,
		0,
		color,
		1
	);
	draw_ring2(x, y, shoot_radius, 10, 360, 1, 0, color, 1, c_white, 0);
	draw_set_alpha(1);
}

var _lineRadius = 10;
//if (!stamina_unlimit) {
_color2 = c_red;
//} else {
//_color2 = c_green;
//}
var _color = c_yellow;

_lineRadius = 5;

var _summon_angle = (summon_cost / 100) * 360;
var _shoot_angle = (shoot_cost / 100) * 360;
if (stamina_limit >= summon_cost) {
	draw_set_color(
		merge_color(
			c_white,
			c_pink,
			clamp(stamina_warning / stamina_warning_duration, 0, 1)
		)
	);
	draw_line_width(
		x - lengthdir_x(106 - _lineRadius, _summon_angle),
		y + lengthdir_y(106 - _lineRadius, _summon_angle),
		x - lengthdir_x(106 + _lineRadius, _summon_angle),
		y + lengthdir_y(106 + _lineRadius, _summon_angle),
		3
	);
	if (stamina_limit >= shoot_cost) {
		draw_line_width(
			x - lengthdir_x(106 - _lineRadius, _shoot_angle),
			y + lengthdir_y(106 - _lineRadius, _shoot_angle),
			x - lengthdir_x(106 + _lineRadius, _shoot_angle),
			y + lengthdir_y(106 + _lineRadius, _shoot_angle),
			3
		);
	}
}

for (var i = 360; i > _lerp_stamina_limit_angle; i -= 6) {
	if (i < _stamina_limit_angle + 360) {
		_lineRadius = 8 + 3 * sin(i / 10 - anim_stamina_unlimit * 0.2);
		var _d = clamp((i - _stamina_limit_angle) / 180, 0, 1);
		var _angle = i;
		var _radius2 = 0;
		_color = merge_color(c_orange, c_yellow, clamp(i / 360, 0, 1));
		//if (heat > stamina_max) {
		_color = merge_color(_color, c_black, _gradient);
		//}
		//_color = merge_color(_color2, c_yellow, clamp((i - 90) / 180, 0, 1));
		if (i < 0) {
			_color = merge_color(c_red, c_black, _d);
			_radius2 =
				random(9 * (1 - _d))
				* clamp(
					(nodash_heat_recovery_delay + dashing) / nodash_heat_recovery_delay,
					0,
					1
				);
		}

		if (heat >= heat_max) {
			_color = merge_color(c_red, c_white, random(1));
			//_radius2 = random(12);
			//_angle = random(360);
			_lineRadius = random(12);
		}

		if (shield_active) {
			_color = merge_color(color_guard, _color, _d);
		}

		if (stamina_warning > 0) {
			_color = merge_color(
				_color,
				c_pink,
				stamina_warning / stamina_warning_duration
			);
		}

		var _dx = lengthdir_x(_radius2, _angle);
		var _dy = lengthdir_y(_radius2, _angle);
		draw_set_color(_color);
		draw_line_width(
			x + _dx - lengthdir_x(105 - _lineRadius, i),
			y + _dy + lengthdir_y(105 - _lineRadius, i),
			x + _dx - lengthdir_x(105 + _lineRadius, i),
			y + _dy + lengthdir_y(105 + _lineRadius, i),
			4
		);
	}
}

_lineRadius = 10;

draw_set_color(stamina_color);
//draw_line_width(
//x - lengthdir_x(105 - _lineRadius, 360 * _stamina_current),
//y + lengthdir_y(105 - _lineRadius, 360 * _stamina_current),
//x - lengthdir_x(105 + _lineRadius, 360 * _stamina_current),
//y + lengthdir_y(105 + _lineRadius, 360 * _stamina_current),
//5
//);

draw_ring2(
	x,
	y,
	95,
	20,
	360,
	0.008,
	360 * (_stamina_current - 0.008 / 2),
	stamina_color,
	1,
	stamina_color,
	1
);

_lineRadius = 15;

draw_set_color(_color);
draw_line_width(
	x - lengthdir_x(105 - _lineRadius, _lerp_stamina_limit_angle),
	y + lengthdir_y(105 - _lineRadius, _lerp_stamina_limit_angle),
	x - lengthdir_x(105 + _lineRadius, _lerp_stamina_limit_angle),
	y + lengthdir_y(105 + _lineRadius, _lerp_stamina_limit_angle),
	5
);

draw_set_color(c_white);
draw_line_width(
	x - lengthdir_x(105 - _lineRadius, 0),
	y + lengthdir_y(105 - _lineRadius, 0),
	x - lengthdir_x(105 + _lineRadius, 0),
	y + lengthdir_y(105 + _lineRadius, 0),
	5
);

var _sprColor = c_white;
if (damage_mult >= 3) {
	var _flash = abs(sin(global.ANIMATION_TIMER * 0.35));
	_sprColor = merge_color(c_pink, c_black, _flash);
} else if (damage_mult >= 2) {
	var _flash = abs(sin(global.ANIMATION_TIMER * 0.3));
	_sprColor = merge_color(c_red, c_white, _flash);
}

draw_sprite_ext(
	sprite_index,
	0,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	_sprColor,
	invuln > 0 && invuln % 2 ? 0.1 : 1
);
