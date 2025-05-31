var _radius = anim * hitbox_radius;
draw_set_color(c_white);
draw_set_alpha(1);
draw_ring2(x, y, 0, _radius, 24, 1, 0, c_white, 0, c_white, 1 - anim / 2);