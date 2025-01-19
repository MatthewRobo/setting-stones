/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(0.5);
draw_set_color(color);

try{
	//draw_line_width(x,y,summoner.x,summoner.y,5)
	var _normal = point_direction(x, y, summoner.x, summoner.y) + 90;
	var _edge = mine.sprite_width * 0.3;
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex_color(x + lengthdir_x(_edge, _normal), y + lengthdir_y(_edge, _normal), color, 0.5);
	draw_vertex_color(summoner.x, summoner.y, color_point, 0.0);
	draw_vertex_color(x - lengthdir_x(_edge, _normal), y - lengthdir_y(_edge, _normal), color, 0.5);
	draw_primitive_end();
	
	
} catch(_exception) {
}
//draw_set_color(c_white)
draw_set_alpha(1);