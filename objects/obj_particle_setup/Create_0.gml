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

pt_p1summon = part_type_create();

//part_type_sprite(particle_p1_summon,spr_summon,0,0,false);
//part_type_color1(particle_p1_summon,obj_player_1.color);
//part_type_size(particle_p1_summon,1,1,-0.1,0);
//
//part_type_life(particle_p1_summon, 20,20);
//part_type_alpha3(particle_p1_summon,0.5,0.3,0.1);

part_type_sprite(pt_p1summon, spr_triangle, 0, 0, false);

part_type_color_mix(pt_p1summon, obj_player_1.color_front, obj_player_1.color_up);
part_type_size_x(pt_p1summon, 0.1, 0.5, -0.01, 0);
part_type_size_y(pt_p1summon, 0.1, 0.5, -0.01, 0);
part_type_orientation(pt_p1summon, 0, 360, 0, 0, false);
part_type_speed(pt_p1summon, 1, 2, 0, false);
part_type_direction(pt_p1summon, 0, 360, 0, false);

part_type_life(pt_p1summon, 30, 60);
part_type_alpha2(pt_p1summon, random_range(0.3, 0.5), 0);

particle_p2_trail = part_type_create();

//part_type_sprite(particle_p2_trail,Sprite1,0,0,false);
part_type_sprite(particle_p2_trail, Sprite1, 0, 0, false);
part_type_color1(particle_p2_trail, obj_player_2.color);
part_type_size(particle_p2_trail, 1, 1, 0, 0);
//part_type_size(particle_p2_trail,1,1,-0.05,0);

part_type_life(particle_p2_trail, 40, 40);
part_type_alpha3(particle_p2_trail, 0.5, 0.3, 0.1);

pt_p2summon = part_type_create();
//
//part_type_sprite(particle_p2_summon,spr_summon,0,0,false);
//part_type_color1(particle_p2_summon,obj_player_2.color);
//part_type_size(particle_p2_summon,1,1,-0.1,0);
//
//part_type_life(particle_p2_summon, 20,20);
//part_type_alpha3(particle_p2_summon,0.5,0.3,0.1);
//

part_type_sprite(pt_p2summon, spr_triangle, 0, 0, false);

part_type_color_mix(pt_p2summon, obj_player_2.color_front, obj_player_2.color_up);
part_type_size_x(pt_p2summon, 0.1, 0.5, -0.01, 0);
part_type_size_y(pt_p2summon, 0.1, 0.5, -0.01, 0);
part_type_orientation(pt_p2summon, 0, 360, 0, 0, false);
part_type_speed(pt_p2summon, 1, 2, 0, false);
part_type_direction(pt_p2summon, 0, 360, 0, false);

part_type_life(pt_p2summon, 30, 60);
part_type_alpha2(pt_p2summon, random_range(0.3, 0.5), 0);

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

pt_dash = part_type_create();
part_type_shape(pt_dash, pt_shape_ring);
part_type_size(pt_dash, 1, 1, 0.5, 0);
part_type_scale(pt_dash, 0.5, 1);
//part_type_speed(particle_dashcancel, 5, 10, -0.2, 0);
//part_type_direction(particle_dashcancel, 0, 360, 0, 0);
//part_type_gravity(particle_dashcancel, 0, 270);
part_type_orientation(pt_dash, 0, 0, 0, 0, true);
part_type_colour1(pt_dash, c_white);
part_type_alpha2(pt_dash, 1, 0);
part_type_blend(pt_dash, false);
part_type_life(pt_dash, 10, 10);

pt_shield = part_type_create();
part_type_shape(pt_shield, pt_shape_line);
part_type_size(pt_shield, 0, 1, 0, 0);
part_type_scale(pt_shield, 1, 1);
part_type_speed(pt_shield, 1, 5, -0.05, 0);
part_type_direction(pt_shield, 0, 360, 0, 0);
part_type_gravity(pt_shield, 0, 270);
part_type_orientation(pt_shield, 0, 0, 0, 0, true);
part_type_colour3(pt_shield, $FFFFFF, color_guard, $FFFFFF);
part_type_alpha3(pt_shield, 0, 1, 0);
part_type_blend(pt_shield, false);
part_type_life(pt_shield, 10, 40);

//heat_smoke
pt_overheat = part_type_create();
part_type_shape(pt_overheat, pt_shape_cloud);
part_type_size(pt_overheat, 1, 1, 0, 0);
part_type_scale(pt_overheat, 1, 1);
part_type_speed(pt_overheat, 1, 2, -0.02, 0);
part_type_direction(pt_overheat, 0, 360, 0, 0);
part_type_gravity(pt_overheat, 0, 270);
part_type_orientation(pt_overheat, 0, 360, 0, 0, false);
part_type_colour3(pt_overheat, $008FD8, $000096, $000000);
part_type_alpha3(pt_overheat, 1, 0.522, 1);
part_type_blend(pt_overheat, true);
part_type_life(pt_overheat, 80, 80);

//var _pemit1 = part_emitter_create(_ps);
//part_emitter_region(_ps, _pemit1, -50, 50, -50, 50, ps_shape_ellipse, ps_distr_gaussian);
//part_emitter_stream(_ps, _pemit1, particle_overheat, 1);

//hitspark
pt_hitspark = part_type_create();
part_type_shape(pt_hitspark, pt_shape_line);
part_type_size(pt_hitspark, 0, 1, -0.02, 0);
part_type_scale(pt_hitspark, 1, 1);
part_type_speed(pt_hitspark, 10, 25, -0.45, 0);
part_type_direction(pt_hitspark, 0, 360, 0, 0);
part_type_gravity(pt_hitspark, 0, 270);
part_type_orientation(pt_hitspark, 0, 0, 0, 0, true);
part_type_colour3(pt_hitspark, $FFFFFF, $00FFFF, $0000FF);
part_type_alpha3(pt_hitspark, 1, 1, 0);
part_type_blend(pt_hitspark, false);
part_type_life(pt_hitspark, 10, 40);

pt_sendstone = part_type_create();
part_type_shape(pt_sendstone, pt_shape_ring);
part_type_size(pt_sendstone, 7, 7, -0.6, 0);
part_type_scale(pt_sendstone, 1, 1);
part_type_colour1(pt_sendstone, c_white);
part_type_alpha2(pt_sendstone, 1, 0);
part_type_blend(pt_sendstone, false);
part_type_life(pt_sendstone, 10, 10);

//heat_steam
pt_steam = part_type_create();
part_type_shape(pt_steam, pt_shape_cloud);
part_type_size(pt_steam, 1, 1, 0.01, 0);
part_type_scale(pt_steam, 1, 1);
part_type_speed(pt_steam, 1, 2, -0.02, 0);
part_type_direction(pt_steam, 0, 360, 0, 0);
part_type_gravity(pt_steam, 0, 270);
part_type_orientation(pt_steam, 0, 360, 0, 0, false);
part_type_colour3(pt_steam, c_white, c_pink, c_white);
part_type_alpha2(pt_steam, 1, 0);
part_type_blend(pt_steam, false);
part_type_life(pt_steam, 80, 80);

//heat_smoke
pt_smoke = part_type_create();
part_type_shape(pt_smoke, pt_shape_smoke);
part_type_size(pt_smoke, 1, 1, 0.01, 0);
part_type_scale(pt_smoke, 1, 1);
part_type_speed(pt_smoke, 3, 5, -0.02, 0);
part_type_direction(pt_smoke, 0, 360, 0, 0);
part_type_gravity(pt_smoke, 0, 270);
part_type_orientation(pt_smoke, 0, 360, 0, 0, false);
part_type_colour3(pt_smoke, c_black, c_pink, c_black);
part_type_alpha2(pt_smoke, 1, 0);
part_type_blend(pt_smoke, false);
part_type_life(pt_smoke, 80, 80);

pt_trackerdust = part_type_create();
part_type_shape(pt_trackerdust, pt_shape_sphere);
//part_type_sprite(ptype_trackerdust, spr_triangle, false, false, false);
part_type_size(pt_trackerdust, 1, 2, 0, 0);
part_type_scale(pt_trackerdust, 1, 1);
part_type_speed(pt_trackerdust, 0, 0, 0, 0);
part_type_direction(pt_trackerdust, 0, 360, 0, 0);
part_type_gravity(pt_trackerdust, 0, 270);
part_type_orientation(pt_trackerdust, 0, 0, 0, 0, true);
part_type_colour1(pt_trackerdust, c_lime);
part_type_alpha3(pt_trackerdust, 0, 1, 0);
part_type_blend(pt_trackerdust, false);
part_type_life(pt_trackerdust, 10, 40);

//pt_shard
pt_shard = part_type_create();
part_type_sprite(pt_shard, spr_shard_b, false, false, false);
part_type_size(pt_shard, 0.8, 1.2, -0.002, 0);
part_type_scale(pt_shard, 0.5, 0.5);
part_type_speed(pt_shard, 1, 3, -0.1, 0);
part_type_direction(pt_shard, 0, 360, 0, 0);
part_type_gravity(pt_shard, 0, 270);
part_type_orientation(pt_shard, 0, 0, 0, 0, true);
part_type_colour1(pt_shard, c_lime);
part_type_alpha2(pt_shard, 1, 0);
part_type_blend(pt_shard, false);
part_type_life(pt_shard, 20, 40);

//pt_rockspawn
pt_setstone = part_type_create();
part_type_shape(pt_setstone, pt_shape_ring);
part_type_size(pt_setstone, 1, 1, 0.6, 0);
part_type_scale(pt_setstone, 1, 1);
part_type_speed(pt_setstone, 0, 0, 0, 0);
part_type_direction(pt_setstone, 80, 100, 0, 0);
part_type_gravity(pt_setstone, 0, 270);
part_type_orientation(pt_setstone, 0, 0, 0, 0, false);
part_type_colour1(pt_setstone, $00FF00);
part_type_alpha2(pt_setstone, 1, 0);
part_type_blend(pt_setstone, false);
part_type_life(pt_setstone, 10, 10);

//pt_rockwarning
pt_rockwarning = part_type_create();
part_type_sprite(pt_rockwarning, spr_warning, false, true, false)
part_type_size(pt_rockwarning, 1, 1, 0, 0);
part_type_scale(pt_rockwarning, 1, 1/50);
part_type_speed(pt_rockwarning, 0, 0, 0, 0);
part_type_direction(pt_rockwarning, 0, 0, 0, 0);
part_type_gravity(pt_rockwarning, 0, 270);
part_type_orientation(pt_rockwarning, 0, 0, 0, 0, false);
part_type_colour1(pt_rockwarning, $FFFFF);
part_type_alpha2(pt_rockwarning, 1, 0);
part_type_blend(pt_rockwarning, false);
part_type_life(pt_rockwarning, 15, 15);

pt_warningsign = part_type_create();
part_type_sprite(pt_warningsign, spr_warningarrow, false, true, false)
part_type_size(pt_warningsign, 1, 1, 0, 0);
part_type_scale(pt_warningsign, 1/768, 1/768);
var _spd = 5;
part_type_speed(pt_warningsign, _spd, _spd, -_spd/45*2, 0);

part_type_direction(pt_warningsign, 0, 0, 0, 0);
part_type_gravity(pt_warningsign, 0, 270);
part_type_orientation(pt_warningsign, 0, 0, 0, 0, false);
part_type_colour1(pt_warningsign, c_white);
part_type_alpha2(pt_warningsign, 1, 0);
//part_type_alpha3(pt_warningsign, 0, 1, 0);
part_type_blend(pt_warningsign, false);
part_type_life(pt_warningsign, 45, 45);

