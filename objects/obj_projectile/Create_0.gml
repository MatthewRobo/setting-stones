/// @description Insert description here
// You can write your code in this editor
summoner=1;
target=2;
maxspeed=60;
xdir=0;
ydir=0;
xspd=0
yspd=0;
hp=1;
active=true;
summoner_original=1;

shoot = function(){
	direction=point_direction(x,y,x+xdir,y+ydir);
	image_angle=direction
	xspd=lengthdir_x(maxspeed,direction)
	yspd=lengthdir_y(maxspeed,direction);
}