function draw_ring2(centerX, centerY, innerRadius, thickness, precision, percentage, rotation, colInner, alphaInner, colOuter, alphaOuter)
{
	var _angleStep = 360 / precision;
	var _innerRadius = max(0, innerRadius);
	var _outerRadius = max(0, innerRadius + thickness);
	
	draw_primitive_begin(pr_trianglestrip);	
	for (var i = 0; i <= 360 * percentage; i += _angleStep) {
		draw_vertex_color(centerX - lengthdir_x(_innerRadius, i + rotation), centerY + lengthdir_y(_innerRadius, i + rotation), colInner, alphaInner);
		draw_vertex_color(centerX - lengthdir_x(_outerRadius, i + rotation), centerY + lengthdir_y(_outerRadius, i + rotation), colOuter, alphaOuter);
	}
	draw_primitive_end();
}

function text_outline() 
{
	//x,y: Coordinates to draw
	//str: String to draw
	//arugment3 = outwidth: Width of outline in pixels
	//argument4 = outcol: Colour of outline (main text draws with regular set colour)
	//argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	//argument6 = separation, for the draw_text_EXT command.
	//argument7 = width for the draw_text_EXT command.

	//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
	var dto_dcol = draw_get_color();

	draw_set_color(argument4);

	for (var dto_i = 45; dto_i < 405; dto_i += 360 / argument5) {
		//draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
		draw_text_ext(
			argument0 + round(lengthdir_x(argument3, dto_i)),
			argument1 + round(lengthdir_y(argument3, dto_i)),
			argument2,
			argument6,
			argument7
		);
	}

	draw_set_color(dto_dcol);

	draw_text_ext(argument0, argument1, argument2, argument6, argument7);
};

