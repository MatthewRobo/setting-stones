draw_set_alpha(1);

//draw_sprite_stretched(spr_bg_gameplay, 0, camCenter - 1500, camMiddle - 1500, 3000, 3000);
//draw_circle(camCenter, camMiddle, 250, false);

draw_sprite_pos(spr_horizon, 0, camCenter - 1500, camMiddle + 500, camCenter + 1500, camMiddle + 500, room_width, room_height, 0, room_height, 1);

for (var i = 0; i < 1; i+= 0.1) {
	for (var j = 0; j <= 1; j += 0.1) {
		var _x0 = camCenter - 1500 * (j + 1);
		var _x1 = camCenter + 1500 * (j + 1);
		var _x = lerp(_x0, _x1, i);
		var _x2 = lerp(_x0, _x1, i + 0.1);
		var _y0 = camMiddle + 500;
		var _y1 = room_height;
		var _y = lerp(_y0, _y1, j);
		var _y2 = lerp(_y0, _y1, j + 0.1);
		
		draw_set_color(random(c_white));
		draw_primitive_begin(pr_linestrip);
		draw_vertex(_x, _y);
		draw_vertex(_x2, _y);
		draw_vertex(_x2, _y2); 
		draw_vertex(_x, _y2);

		draw_primitive_end();
	}
}