////ps_background
//var _ps = part_system_create();
//part_system_draw_order(_ps, true);
//
////pt_grey_clouds
//var _ptype1 = part_type_create();
//part_type_shape(_ptype1, pt_shape_explosion);
//part_type_size(_ptype1, 1, 3, -0.012, 0);
//part_type_scale(_ptype1, 1, 1);
//part_type_speed(_ptype1, 0, 1, 0, 0);
//part_type_direction(_ptype1, 270, 270, 0, 0);
//part_type_gravity(_ptype1, 0, 270);
//part_type_orientation(_ptype1, 0, 360, 0, 0, false);
//part_type_colour3(_ptype1, $FFFFFF, $7F7F7F, $000000);
//part_type_alpha3(_ptype1, 0, 1, 0);
//part_type_blend(_ptype1, false);
//part_type_life(_ptype1, 120, 240);
//
//var _pemit1 = part_emitter_create(_ps);
//part_emitter_region(_ps, _pemit1, -room_width/2, room_width/2, -25, 125, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(_ps, _pemit1, _ptype1, 3);
//
////pt_white_clouds
//var _ptype2 = part_type_create();
//part_type_shape(_ptype2, pt_shape_cloud);
//part_type_size(_ptype2, 1, 4, -0.01, 0);
//part_type_scale(_ptype2, 1, 1);
//part_type_speed(_ptype2, 1, 0, 0, 0);
//part_type_direction(_ptype2, 270, 270, 0, 0);
//part_type_gravity(_ptype2, 0, 270);
//part_type_orientation(_ptype2, 0, 360, 0, 0, false);
//part_type_colour3(_ptype2, $FFFFFF, $E5E5E5, $000000);
//part_type_alpha3(_ptype2, 0, 1, 0);
//part_type_blend(_ptype2, false);
//part_type_life(_ptype2, 120, 240);
//
//var _pemit2 = part_emitter_create(_ps);
//part_emitter_region(_ps, _pemit2, -room_width/2, room_width/2, -100, 100, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(_ps, _pemit2, _ptype2, 3);
//
//part_system_position(_ps, room_width/2, room_height/2);
//

camCenter = room_width/2;
camMiddle = room_height/2;