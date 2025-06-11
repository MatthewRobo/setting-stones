if (instance_number(obj_actor) == 1) {
	x = lerp(x, obj_actor.x, 0.4);
	y = lerp(y, obj_actor.y, 0.4);
	image_xscale = lerp(image_xscale, 1, 0.1);
	image_yscale = image_xscale;
}
