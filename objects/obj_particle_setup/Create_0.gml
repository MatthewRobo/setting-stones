/// @description Insert description here
// You can write your code in this editor

particle_system = part_system_create_layer("particles", false);

particle_p1_trail = part_type_create();

//part_type_sprite(particle_p1_trail,Sprite1,0,0,false);
part_type_sprite(particle_p1_trail, Sprite1, 0, 0, false);
part_type_color1(particle_p1_trail, obj_player_1.color);
part_type_size(particle_p1_trail, 1, 1, 0, 0);
//part_type_size(particle_p1_trail,1,1,-0.05,0);

part_type_life(particle_p1_trail, 40, 40);
part_type_alpha3(particle_p1_trail, 0.5, 0.3, 0.1);

particle_p1_summon = part_type_create();

//part_type_sprite(particle_p1_summon,spr_summon,0,0,false);
//part_type_color1(particle_p1_summon,obj_player_1.color);
//part_type_size(particle_p1_summon,1,1,-0.1,0);
//
//part_type_life(particle_p1_summon, 20,20);
//part_type_alpha3(particle_p1_summon,0.5,0.3,0.1);

part_type_sprite(particle_p1_summon, spr_triangle, 0, 0, false);

part_type_color_mix(particle_p1_summon, obj_player_1.color_front, obj_player_1.color_up);
part_type_size_x(particle_p1_summon, 0.1, 0.5, -0.01, 0);
part_type_size_y(particle_p1_summon, 0.1, 0.5, -0.01, 0);
part_type_orientation(particle_p1_summon, 0, 360, 0, 0, false);
part_type_speed(particle_p1_summon, 1, 2, 0, false);
part_type_direction(particle_p1_summon, 0, 360, 0, false);

part_type_life(particle_p1_summon, 30, 60);
part_type_alpha2(particle_p1_summon, random_range(0.3, 0.5), 0);

particle_p2_trail = part_type_create();

//part_type_sprite(particle_p2_trail,Sprite1,0,0,false);
part_type_sprite(particle_p2_trail, Sprite1, 0, 0, false);
part_type_color1(particle_p2_trail, obj_player_2.color);
part_type_size(particle_p2_trail, 1, 1, 0, 0);
//part_type_size(particle_p2_trail,1,1,-0.05,0);

part_type_life(particle_p2_trail, 40, 40);
part_type_alpha3(particle_p2_trail, 0.5, 0.3, 0.1);

particle_p2_summon = part_type_create();
//
//part_type_sprite(particle_p2_summon,spr_summon,0,0,false);
//part_type_color1(particle_p2_summon,obj_player_2.color);
//part_type_size(particle_p2_summon,1,1,-0.1,0);
//
//part_type_life(particle_p2_summon, 20,20);
//part_type_alpha3(particle_p2_summon,0.5,0.3,0.1);
//

part_type_sprite(particle_p2_summon, spr_triangle, 0, 0, false);

part_type_color_mix(particle_p2_summon, obj_player_2.color_front, obj_player_2.color_up);
part_type_size_x(particle_p2_summon, 0.1, 0.5, -0.01, 0);
part_type_size_y(particle_p2_summon, 0.1, 0.5, -0.01, 0);
part_type_orientation(particle_p2_summon, 0, 360, 0, 0, false);
part_type_speed(particle_p2_summon, 1, 2, 0, false);
part_type_direction(particle_p2_summon, 0, 360, 0, false);

part_type_life(particle_p2_summon, 30, 60);
part_type_alpha2(particle_p2_summon, random_range(0.3, 0.5), 0);

//
//particle_dashcancel = part_type_create();
//part_type_shape(particle_dashcancel, pt_shape_line);
//part_type_size(particle_dashcancel, 0, 1, 0, 0);
//part_type_scale(particle_dashcancel, 1, 1);
//part_type_speed(particle_dashcancel, 5, 10, -0.2, 0);
//part_type_direction(particle_dashcancel, 0, 360, 0, 0);
//part_type_gravity(particle_dashcancel, 0, 270);
//part_type_orientation(particle_dashcancel, 0, 0, 0, 0, true);
//part_type_colour3(particle_dashcancel, $00FFFF, $00D4FF, $0000FF);
//part_type_alpha3(particle_dashcancel, 0, 1, 0);
//part_type_blend(particle_dashcancel, false);
//part_type_life(particle_dashcancel, 10, 40);
//
//

particle_dashcancel = part_type_create();
part_type_shape(particle_dashcancel, pt_shape_ring);
part_type_size(particle_dashcancel, 1, 1, 0.6, 0);
part_type_scale(particle_dashcancel, 1, 1);
//part_type_speed(particle_dashcancel, 5, 10, -0.2, 0);
//part_type_direction(particle_dashcancel, 0, 360, 0, 0);
//part_type_gravity(particle_dashcancel, 0, 270);
//part_type_orientation(particle_dashcancel, 0, 0, 0, 0, true);
part_type_colour1(particle_dashcancel, c_white);
part_type_alpha2(particle_dashcancel, 1, 0);
part_type_blend(particle_dashcancel, false);
part_type_life(particle_dashcancel, 10, 10);

particle_guard = part_type_create();
part_type_shape(particle_guard, pt_shape_line);
part_type_size(particle_guard, 0, 1, 0, 0);
part_type_scale(particle_guard, 1, 1);
part_type_speed(particle_guard, 1, 5, -0.05, 0);
part_type_direction(particle_guard, 0, 360, 0, 0);
part_type_gravity(particle_guard, 0, 270);
part_type_orientation(particle_guard, 0, 0, 0, 0, true);
part_type_colour3(particle_guard, $FFFFFF, color_guard, $FFFFFF);
part_type_alpha3(particle_guard, 0, 1, 0);
part_type_blend(particle_guard, false);
part_type_life(particle_guard, 10, 40);

//heat_smoke
particle_overheat = part_type_create();
part_type_shape(particle_overheat, pt_shape_cloud);
part_type_size(particle_overheat, 1, 1, 0, 0);
part_type_scale(particle_overheat, 1, 1);
part_type_speed(particle_overheat, 1, 2, -0.02, 0);
part_type_direction(particle_overheat, 0, 360, 0, 0);
part_type_gravity(particle_overheat, 0, 270);
part_type_orientation(particle_overheat, 0, 360, 0, 0, false);
part_type_colour3(particle_overheat, $008FD8, $000096, $000000);
part_type_alpha3(particle_overheat, 1, 0.522, 1);
part_type_blend(particle_overheat, true);
part_type_life(particle_overheat, 80, 80);

//var _pemit1 = part_emitter_create(_ps);
//part_emitter_region(_ps, _pemit1, -50, 50, -50, 50, ps_shape_ellipse, ps_distr_gaussian);
//part_emitter_stream(_ps, _pemit1, particle_overheat, 1);

//hitspark
particle_hitspark = part_type_create();
part_type_shape(particle_hitspark, pt_shape_line);
part_type_size(particle_hitspark, 0, 1, -0.02, 0);
part_type_scale(particle_hitspark, 1, 1);
part_type_speed(particle_hitspark, 10, 25, -0.45, 0);
part_type_direction(particle_hitspark, 0, 360, 0, 0);
part_type_gravity(particle_hitspark, 0, 270);
part_type_orientation(particle_hitspark, 0, 0, 0, 0, true);
part_type_colour3(particle_hitspark, $FFFFFF, $00FFFF, $0000FF);
part_type_alpha3(particle_hitspark, 1, 1, 0);
part_type_blend(particle_hitspark, false);
part_type_life(particle_hitspark, 10, 40);

particle_sendstone = part_type_create();
part_type_shape(particle_sendstone, pt_shape_ring);
part_type_size(particle_sendstone, 7, 7, -0.6, 0);
part_type_scale(particle_sendstone, 1, 1);
part_type_colour1(particle_sendstone, c_white);
part_type_alpha2(particle_sendstone, 1, 0);
part_type_blend(particle_sendstone, false);
part_type_life(particle_sendstone, 10, 10);

//ps_heat
var _ps = part_system_create();
part_system_draw_order(_ps, true);

//heat_steam
particle_steam = part_type_create();
part_type_shape(particle_steam, pt_shape_cloud);
part_type_size(particle_steam, 1, 1, 0.01, 0);
part_type_scale(particle_steam, 1, 1);
part_type_speed(particle_steam, 1, 2, -0.02, 0);
part_type_direction(particle_steam, 0, 360, 0, 0);
part_type_gravity(particle_steam, 0, 270);
part_type_orientation(particle_steam, 0, 360, 0, 0, false);
part_type_colour3(particle_steam, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(particle_steam, 1, 0.502, 0);
part_type_blend(particle_steam, false);
part_type_life(particle_steam, 80, 80);

//heat_smoke
particle_smoke = part_type_create();
part_type_shape(particle_smoke, pt_shape_smoke);
part_type_size(particle_smoke, 1, 1, 0.01, 0);
part_type_scale(particle_smoke, 1, 1);
part_type_speed(particle_smoke, 3, 5, -0.02, 0);
part_type_direction(particle_smoke, 0, 360, 0, 0);
part_type_gravity(particle_smoke, 0, 270);
part_type_orientation(particle_smoke, 0, 360, 0, 0, false);
part_type_colour3(particle_smoke, $000000, $000000, $000000);
part_type_alpha3(particle_smoke, 1, 0.502, 0);
part_type_blend(particle_smoke, false);
part_type_life(particle_smoke, 80, 80);

ptype_trackerdust = part_type_create();
part_type_shape(ptype_trackerdust, pt_shape_flare);
//part_type_sprite(ptype_trackerdust, spr_triangle, false, false, false);
part_type_size(ptype_trackerdust, 1, 2, 0, 0);
part_type_scale(ptype_trackerdust, 1, 1);
part_type_speed(ptype_trackerdust, 0, 0, 0, 0);
part_type_direction(ptype_trackerdust, 0, 360, 0, 0);
part_type_gravity(ptype_trackerdust, 0, 270);
part_type_orientation(ptype_trackerdust, 0, 0, 0, 0, true);
part_type_colour1(ptype_trackerdust, $FFFFFF);
part_type_alpha3(ptype_trackerdust, 0, 1, 0);
part_type_blend(ptype_trackerdust, false);
part_type_life(ptype_trackerdust, 10, 40);

