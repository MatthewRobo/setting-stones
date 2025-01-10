/// @description Insert description here
// You can write your code in this editor

particle_system = part_system_create_layer("particles",false);

particle_p1_trail = part_type_create();

part_type_sprite(particle_p1_trail,Sprite1,0,0,false);
part_type_color1(particle_p1_trail,obj_player_1.color);
part_type_size(particle_p1_trail,1,1,-0.05,0);

part_type_life(particle_p1_trail, 40,40);
part_type_alpha3(particle_p1_trail,0.5,0.3,0.1);

particle_p1_summon = part_type_create();

part_type_sprite(particle_p1_summon,spr_summon,0,0,false);
part_type_color1(particle_p1_summon,obj_player_1.color);
part_type_size(particle_p1_summon,1,1,-0.1,0);

part_type_life(particle_p1_summon, 20,20);
part_type_alpha3(particle_p1_summon,0.5,0.3,0.1);


particle_p2_trail = part_type_create();

part_type_sprite(particle_p2_trail,Sprite1,0,0,false);
part_type_color1(particle_p2_trail,obj_player_2.color);
part_type_size(particle_p2_trail,1,1,-0.05,0);

part_type_life(particle_p2_trail, 40,40);
part_type_alpha3(particle_p2_trail,0.5,0.3,0.1);


particle_p2_summon = part_type_create();

part_type_sprite(particle_p2_summon,spr_summon,0,0,false);
part_type_color1(particle_p2_summon,obj_player_2.color);
part_type_size(particle_p2_summon,1,1,-0.1,0);

part_type_life(particle_p2_summon, 20,20);
part_type_alpha3(particle_p2_summon,0.5,0.3,0.1);