/// @description Insert description here
// You can write your code in this editor

#macro color_guard #AFE1AF


var _radius = sprite_width/2;

//draw_set_alpha(alarm[1] > 0 ? alarm[1] % 2 : 1 );
//draw_set_color(c_white);
//draw_circle(x, y, _radius + 7, false);
//draw_set_color(c_black);
//draw_circle(x, y, _radius + 4, false);
//draw_set_color(alarm[1] > 0 && alarm[1] % 2 ? c_white : color);
//draw_circle(x, y, _radius,     false);


var _color2 = color_guard;
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
	//draw_vertex(_p0[0] + lengthdir_x(_w0, _n0), _p0[1] + lengthdir_y(_w0, _n0));
	//draw_vertex(_p0[0] - lengthdir_x(_w0, _n0), _p0[1] - lengthdir_y(_w0, _n0));
	//draw_vertex(_p1[0] + lengthdir_x(_w1, _n1), _p1[1] + lengthdir_y(_w1, _n1));
	//draw_vertex(_p1[0] - lengthdir_x(_w1, _n1), _p1[1] - lengthdir_y(_w1, _n1));
	var _c0 = merge_color(color_slow, color_fast, power(clamp((_d0 - walk_speed) / (tapdash_speed - walk_speed), 0, 1), 2));
	var _c1 = merge_color(color_slow, color_fast, power(clamp((_d1 - walk_speed) / (tapdash_speed - walk_speed), 0, 1), 2));
	
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
		
		draw_vertex_color(_p0[0] + lengthdir_x(_w0, _n0) + random_range(-(heat - 100) / 50, (heat - 100) / 50), _p0[1] + lengthdir_y(_w0, _n0) - random_range(-(heat - 100) / 50, (heat - 100) / 50), _c0, _a0);
		draw_vertex_color(_p0[0] - lengthdir_x(_w0, _n0) - random_range(-(heat - 100) / 50, (heat - 100) / 50), _p0[1] - lengthdir_y(_w0, _n0) - random_range(-(heat - 100) / 50, (heat - 100) / 50), _c0, _a0);
		draw_vertex_color(_p1[0] + lengthdir_x(_w1, _n1) + random_range(-(heat - 100) / 50, (heat - 100) / 50), _p1[1] + lengthdir_y(_w1, _n1) + random_range(-(heat - 100) / 50, (heat - 100) / 50), _c1, _a1);
		draw_vertex_color(_p1[0] - lengthdir_x(_w1, _n1) + random_range(-(heat - 100) / 50, (heat - 100) / 50), _p1[1] - lengthdir_y(_w1, _n1) + random_range(-(heat - 100) / 50, (heat - 100) / 50), _c1, _a1);

	} else {
		draw_vertex_color(_p0[0] + lengthdir_x(_w0, _n0), _p0[1] + lengthdir_y(_w0, _n0), _c0, _a0);
		draw_vertex_color(_p0[0] - lengthdir_x(_w0, _n0), _p0[1] - lengthdir_y(_w0, _n0), _c0, _a0);
		draw_vertex_color(_p1[0] + lengthdir_x(_w1, _n1), _p1[1] + lengthdir_y(_w1, _n1), _c1, _a1);
		draw_vertex_color(_p1[0] - lengthdir_x(_w1, _n1), _p1[1] - lengthdir_y(_w1, _n1), _c1, _a1);

	}
	

}

draw_primitive_end();
if (was_hit) {
	draw_set_color(color);
	draw_set_alpha(1);
	var _len = 40;
	draw_line_width(x - _len, y - _len, x + _len, y + _len, 16);
	draw_line_width(x - _len, y + _len, x + _len, y - _len, 16);
}

draw_set_alpha(0.7)
if(fd_check && !hittable){
	//draw_circle_color(x,y,100,color_guard, color_guard, false);
	draw_ring2(x, y, 0, 100, 24, 1, 0, c_white, 0.2, color_guard, 1);
} 

//draw_sprite_ext(Sprite1,0,x,y,1,1,0,color,1)



draw_set_alpha(0.3)

draw_set_color(stamina_color);

var _angle_plus = 0;
//var _angle_plus = 3/360;
var _stamina_limit = stamina_limit/stamina_max + _angle_plus;
var _stamina_current = stamina/stamina_max;

var _lerp_stamina_limit = anim_stamina_limit/stamina_max + _angle_plus;
var _stamina_limit_angle = 360 * _stamina_limit;

var _lerp_stamina_limit_angle = 360 * _lerp_stamina_limit;
draw_circle_width(95,5, 360, _stamina_limit);
draw_circle_width(110,5, 360, _stamina_limit);
//draw_circle_width(100, 10, 360, _stamina_limit);


draw_set_alpha(1);
draw_circle_width(100,10, 360, stamina/stamina_max);

if (shooting) {
	//draw_set_alpha(0.5);
	//draw_circle_width_shoot(shoot_radius,10, 360)
	var _ringThick = shoot_radius * 0.2;
	draw_ring2(x, y, shoot_radius - _ringThick, _ringThick, 360, 1, 0, color, 0, color, 1);
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
var _shoot_angle = (shoot_cost/ 100) * 360;

draw_set_color(c_white);
draw_line_width(x - lengthdir_x(106 - _lineRadius, _summon_angle), y + lengthdir_y(106 - _lineRadius, _summon_angle),
				x - lengthdir_x(106 + _lineRadius, _summon_angle), y + lengthdir_y(106 + _lineRadius, _summon_angle),
				3);
draw_line_width(x - lengthdir_x(106 - _lineRadius, _shoot_angle), y + lengthdir_y(106 - _lineRadius, _shoot_angle),
				x - lengthdir_x(106 + _lineRadius, _shoot_angle), y + lengthdir_y(106 + _lineRadius, _shoot_angle),
				3);


for(var i = 360; i > _lerp_stamina_limit_angle; i -= 6) {
	if (i < _stamina_limit_angle + 360) {
		_lineRadius = 8 + 3 * sin(i / 10 - (anim_stamina_unlimit) * 0.2);
		var _d =clamp(( i - _stamina_limit_angle) / 180, 0, 1);
		var _angle = i;
		var _radius2 = 0; 
		_color = merge_color(c_orange, c_yellow, clamp((i) / 360, 0, 1));
		//_color = merge_color(_color2, c_yellow, clamp((i - 90) / 180, 0, 1));
		if (i < 0) {
			_color = merge_color(c_red, c_black, _d);
			_radius2 = random(9 * (1 - _d)); 

		}
		
		if (heat >= heat_max) {
			_color = merge_color(c_red, c_white, random(1)); 
			//_radius2 = random(12); 
			//_angle = random(360);
			_lineRadius = random(12);
		}
		
		if (fd_triggered) {
			_color = merge_color(color_guard, _color, _d);
		}
		var _dx = lengthdir_x(_radius2, _angle);
		var _dy = lengthdir_y(_radius2, _angle);
		draw_set_color(_color);
		draw_line_width(x + _dx - lengthdir_x(105 - _lineRadius, i), y + _dy + lengthdir_y(105 - _lineRadius, i),
						x + _dx - lengthdir_x(105 + _lineRadius, i), y + _dy + lengthdir_y(105 + _lineRadius, i),
						4);
	}

}


_lineRadius = 10;

draw_set_color(stamina_color);
draw_line_width(x - lengthdir_x(105 - _lineRadius, 360 * _stamina_current), y + lengthdir_y(105 - _lineRadius, 360 * _stamina_current),
				x - lengthdir_x(105 + _lineRadius, 360 * _stamina_current), y + lengthdir_y(105 + _lineRadius, 360 * _stamina_current),
				5);

_lineRadius = 15;

draw_set_color(_color);
draw_line_width(x - lengthdir_x(105 - _lineRadius, _lerp_stamina_limit_angle), y + lengthdir_y(105 - _lineRadius, _lerp_stamina_limit_angle),
				x - lengthdir_x(105 + _lineRadius, _lerp_stamina_limit_angle), y + lengthdir_y(105 + _lineRadius, _lerp_stamina_limit_angle),
				5);

draw_set_color(c_white);
draw_line_width(x - lengthdir_x(105 - _lineRadius, 0), y + lengthdir_y(105 - _lineRadius, 0),
				x - lengthdir_x(105 + _lineRadius, 0), y + lengthdir_y(105 + _lineRadius, 0),
				5);






draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, alarm[1] > 0 && alarm[1] % 2 ? 0.1: 1);
