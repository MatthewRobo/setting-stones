/// @description Insert description here
// You can write your code in this editor
normalise_speed()

x+=xspd
y+=yspd


if(x<-100||x>room_width+100){
	instance_destroy()
}
if(y<-100||y>room_height+100){
	instance_destroy()
}