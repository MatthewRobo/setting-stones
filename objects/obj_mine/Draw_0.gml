/// @description Insert description here
// You can write your code in this editor

part_particles_create(obj_particle_setup.particle_system,x,y,particles,1);

if(xspd==0 && yspd==0){
	if(active){
		draw_sprite_ext(spr_summon,0,x,y,1,1,0,merge_color(color,c_black,0.2),1)
	}else{
		draw_sprite_ext(spr_summon,0,x,y,1,1,0,merge_color(color,c_black,0.5),1)
	}
}else{
	draw_sprite_ext(spr_summon,0,x,y,1,1,0,merge_color(color,c_white,0.5),1)
}