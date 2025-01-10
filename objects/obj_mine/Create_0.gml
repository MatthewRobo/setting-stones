/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
color=c_white
particles=pointer_null
active=false;

tracker=pointer_null
accel=75
xaccel=0;
yaccel=0;
shot=false;

shoot = function(){
	
	xaccel=0;
	yaccel=0;
	xspd=xspd*0.1;
	yspd=yspd*0.1;
	
}

while(place_meeting(x,y,target) && !active){
	x=summoner.x+random_range(-200,200)
	y=summoner.y+random_range(-200,200)
	
}

alarm[0]=30;

shoot_melee = function(melee){
	direction=point_direction(melee.x,melee.y,x,y)
	image_angle=direction
	xspd=lengthdir_x(maxspeed,direction)
	yspd=lengthdir_y(maxspeed,direction);
	hp=1;


}