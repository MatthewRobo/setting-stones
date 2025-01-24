/// @description Insert description here
// You can write your code in this editor

var _fade = 0;
var _color_fade = c_black;

var _ratio = max(0, alarm[0] / 30);
var _ratio2 = power(_ratio, 2);
var _wiggle = 128 * _ratio2;
draw_set_alpha(1 - (_ratio2 / 2));

if (xspd == 0 && yspd == 0) {
	if (active) {
		_fade = 0.2;
	} else {
		_fade = 0.5;
	}
} else {}
for (var i = 0; i < sides; i++) {
	var j = i < (sides - 1) ? i + 1 : 0;

	//var idx = lengthdir_x(dists[i] + _wiggle, angles[i]);
	//var idy = lengthdir_y(dists[i] + _wiggle, angles[i]);
	//var jdx = lengthdir_x(dists[j] + _wiggle, angles[j]);
	//var jdy = lengthdir_y(dists[j] + _wiggle, angles[j]);
	var idx = lengthdir_x(dists[i] + _wiggle, angles[i] + rotation);
	var idy = lengthdir_y(dists[i] + _wiggle, angles[i] + rotation);
	var jdx = lengthdir_x(dists[j] + _wiggle, angles[j] + rotation);
	var jdy = lengthdir_y(dists[j] + _wiggle, angles[j] + rotation);

	var midpoint = [x + (idx + jdx) / 2, y + (idy + jdy) / 2];

	var normal = point_direction(idx, idy, jdx, jdy) - 90;
	var nGradientX = lengthdir_x(1, normal - lightDir);
	var nGradientY = lengthdir_y(1, normal - lightDir);
	var gradient = 0.5 + abs(nGradientX) / 2;
	var gradientX = 0.5 * (1 + nGradientX);
	var gradientY = 0.5 * (1 + nGradientY);
	var _color = merge_color(
		color_front,
		nGradientX > 0 ? color_up : color_down,
		abs(nGradientX)
	);
	_color = merge_color(
		_color,
		nGradientY > 0 ? color_right : color_left,
		abs(nGradientY)
	);
	draw_set_color(merge_color(_color, _color_fade, _fade));
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(x + idx, y + idy);
	draw_vertex(x, y);
	draw_vertex(x + jdx, y + jdy);
	draw_primitive_end();
}

//draw_set_alpha(1);

draw_set_color(merge_color(color_front, _color_fade, _fade));
draw_primitive_begin(pr_trianglestrip);
for (var i = 0; i < sides; i++) {
	var j = i < (sides - 1) ? i + 1 : 0;
	draw_vertex(
		x + lengthdir_x(dists_in[i], angles[i] + rotation),
		y + lengthdir_y(dists_in[i], angles[i] + rotation)
	);
	draw_vertex(x, y);
	draw_vertex(
		x + lengthdir_x(dists_in[j], angles[j] + rotation),
		y + lengthdir_y(dists_in[j], angles[j] + rotation)
	);
	//draw_vertex(x + lengthdir_x(dists_in[i], angles[i]), y + lengthdir_y(dists_in[i], angles[i]));
	//draw_vertex(x, y);
	//draw_vertex(x + lengthdir_x(dists_in[j], angles[j]), y + lengthdir_y(dists_in[j], angles[j]));
}
draw_primitive_end();

draw_set_color(c_black);
draw_set_alpha(1);
//draw_text_transformed(x,y - 15, hp, 0.2, 0.2, 0); 
