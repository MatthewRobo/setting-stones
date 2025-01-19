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