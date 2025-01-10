/// @description Insert description here
// You can write your code in this editor

part_particles_create(obj_particle_setup.particle_system,x,y,particles,1);

draw_set_alpha(0.7)
if(fd_check&& !hittable){
	draw_circle_color(x,y,100,#AFE1AF,#AFE1AF,false)
}

draw_sprite_ext(Sprite1,0,x,y,1,1,0,color,1)



draw_set_alpha(0.5)

draw_set_color(stamina_color)

draw_circle_width(95,5, 360, 1)
draw_circle_width(110,5, 360, 1)
draw_set_alpha(1)
draw_circle_width(100,10, 360, stamina/100)
draw_set_alpha(0.5)
draw_circle_width_shoot(shoot_radius,10, 360)
draw_set_alpha(1)



draw_set_color(c_white)