/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player_1) && instance_exists(obj_player_2)){
	if(rectangle_in_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),obj_player_1.x-100,obj_player_1.y-100,obj_player_1.x+100,obj_player_1.y+100)
	||
	
	rectangle_in_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),obj_player_2.x-100,obj_player_2.y-100,obj_player_2.x+100,obj_player_2.y+100)){
		
		alpha[0]=lerp(alpha[0],0.2,0.05);
	}else{
		alpha[0]=lerp(alpha[0],1,0.05);
	}
	
	if(rectangle_in_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+0.4)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),obj_player_1.x-100,obj_player_1.y-100,obj_player_1.x+100,obj_player_1.y+100)
	||
	
	rectangle_in_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+0.4)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),obj_player_2.x-100,obj_player_2.y-100,obj_player_2.x+100,obj_player_2.y+100)){
		
		alpha[1]=lerp(alpha[1],0.2,0.05);
	}else{
		alpha[1]=lerp(alpha[1],1,0.05);
	}
}


//p1 hp bar

draw_set_alpha(alpha[0])
draw_set_color(c_white)
draw_rectangle(initial_camera_size*(health_bar_offset_x),initial_camera_size*(health_bar_offset_y),initial_camera_size*(health_bar_offset_x+0.4),initial_camera_size*(health_bar_offset_y+0.07),false)
draw_set_color(c_aqua)
var p1hp=0;
if(instance_exists(obj_player_1)){
	p1hp=obj_player_1.hp	
	
}else{
	p1hp=0;	
}
draw_set_color(c_black)
draw_rectangle(initial_camera_size*(health_bar_offset_x+0.4-health_border),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(health_bar_offset_x+health_border),initial_camera_size*(health_bar_offset_y+0.05-health_border),false)
draw_set_color(#0047AB)
if(p1hp>0){
	draw_rectangle(initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1hp/10))),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(health_bar_offset_x+0.4-health_border),initial_camera_size*(health_bar_offset_y+0.05-health_border),false)
}





draw_set_color(c_white)
for(i=1;i<10;i++){
	
	draw_line_width(initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-i/10))),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-i/10))),initial_camera_size*(health_bar_offset_y+0.05-health_border),5)
}

////p1 stamina
//var p1stamina=0;
//if(instance_exists(obj_player_1)){
//	p1stamina=obj_player_1.stamina
	
//}else{
//	p1stamina=0;	
//}

//draw_set_color(c_green)
//if(p1stamina>0){
//	draw_rectangle(min(initial_camera_size*(health_bar_offset_x+health_border+(0.4*(1-p1stamina/100))),initial_camera_size*(health_bar_offset_x+0.4-health_border)),initial_camera_size*(health_bar_offset_y+health_border+0.045),initial_camera_size*(health_bar_offset_x+0.4-health_border),initial_camera_size*(health_bar_offset_y+0.055),false)
//}
////p2 stamina

//var p2stamina=0;
//if(instance_exists(obj_player_2)){
//	p2stamina=obj_player_2.stamina
	
//}else{
//	p2stamina=0;	
//}
//draw_set_color(c_green)

//if(p2stamina>0){
//	draw_rectangle(max(initial_camera_size*(1-(health_bar_offset_x+health_border+(0.4*(1-p2stamina/100)))),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border))),initial_camera_size*(health_bar_offset_y+health_border+0.045),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border)),initial_camera_size*(health_bar_offset_y+0.055),false)
//}

//p1 meter
var p1meter=0;
if(instance_exists(obj_player_1)){
	p1meter=obj_player_1.meter
	
}else{
	p1meter=0;	
}

var p1ultcost=0;
if(instance_exists(obj_player_1)){
	p1ultcost=obj_player_1.ultimate_cost
	
}else{
	p1ultcost=25;	
}

var p1fdcost=0;
if(instance_exists(obj_player_1)){
	p1fdcost=obj_player_1.fd_cost
	
}else{
	p1fdcost=20;	
}

draw_set_color(c_black)

draw_rectangle(initial_camera_size*(health_bar_offset_x+health_border),initial_camera_size*(health_bar_offset_y+0.05),initial_camera_size*(health_bar_offset_x+0.4-health_border),initial_camera_size*(health_bar_offset_y+0.065),false)

if(p1meter>=p1ultcost){
	draw_set_color(#ffcc00)
}else if (p1meter>=p1fdcost){
	draw_set_color(#1dd01e)
}else{
	draw_set_color(#5553d3)	
}
if(p1meter>0){
	draw_rectangle(initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1meter/100))),initial_camera_size*(health_bar_offset_y+0.05),initial_camera_size*(health_bar_offset_x+0.4-health_border),initial_camera_size*(health_bar_offset_y+0.065),false)
}

draw_set_color(c_white)


draw_line_width(initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1ultcost/100))),initial_camera_size*(health_bar_offset_y+0.045),initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1ultcost/100))),initial_camera_size*(health_bar_offset_y+0.065),5 )


draw_line_width(initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1fdcost/100))),initial_camera_size*(health_bar_offset_y+0.045),initial_camera_size*(health_bar_offset_x+health_border+(((health_bar_offset_x+0.4-health_border)-(health_bar_offset_x+health_border))*(1-p1fdcost/100))),initial_camera_size*(health_bar_offset_y+0.065),5 )


//p2 hp bar
draw_set_alpha(alpha[1])

draw_set_color(c_white)
draw_rectangle(initial_camera_size*(1-health_bar_offset_x),initial_camera_size*(health_bar_offset_y),initial_camera_size*(1-(health_bar_offset_x+0.4)),initial_camera_size*(health_bar_offset_y+0.07),false)
draw_set_color(c_red)
var p2hp=0;
if(instance_exists(obj_player_2)){
	p2hp=obj_player_2.hp	
	
}else{
	p2hp=0;	
}



draw_set_color(c_black)
draw_rectangle(initial_camera_size*(1-(health_bar_offset_x+health_border+(0.4*(1-10/10)))),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border)),initial_camera_size*(health_bar_offset_y+0.05-health_border),false)
draw_set_color(c_red)
if(p2hp>0){
	draw_rectangle(initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2hp/10)),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border)),initial_camera_size*(health_bar_offset_y+0.05-health_border),false)
}

draw_set_color(c_white)
for(i=1;i<10;i++){
	
	draw_line_width(initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(i/10)),initial_camera_size*(health_bar_offset_y+health_border),initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(i/10)),initial_camera_size*(health_bar_offset_y+0.05-health_border),5)
}
//p2 meter
var p2meter=0;
if(instance_exists(obj_player_2)){
	p2meter=obj_player_2.meter
	
}else{
	p2meter=0;	
}

var p2fdcost=0;
if(instance_exists(obj_player_2)){
	p2fdcost=obj_player_2.fd_cost
	
}else{
	p2fdcost=20;	
}

var p2ultcost=0;
if(instance_exists(obj_player_2)){
	p2ultcost=obj_player_2.ultimate_cost
	
}else{
	p2ultcost=25;	
}

draw_set_color(c_black)
draw_rectangle(max(initial_camera_size*(1-(health_bar_offset_x+health_border+(0.4*(1-100/100)))),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border))),initial_camera_size*(health_bar_offset_y+0.05),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border)),initial_camera_size*(health_bar_offset_y+0.065),false)
if(p2meter>=p2ultcost){
	draw_set_color(#ffcc00)
}else if (p2meter>=p2fdcost){
	draw_set_color(#1dd01e)
}else{
	draw_set_color(#5553d3)	
}




if(p2meter>0){
	draw_rectangle(initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2meter/100)),initial_camera_size*(health_bar_offset_y+0.05),initial_camera_size*(1-(health_bar_offset_x+(0.4)-health_border)),initial_camera_size*(health_bar_offset_y+0.065),false)
}


draw_set_color(c_white)

draw_line_width(initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2ultcost/100)),initial_camera_size*(health_bar_offset_y+0.045),initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2ultcost/100)),initial_camera_size*(health_bar_offset_y+0.065),5 )


draw_line_width(initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2fdcost/100)),initial_camera_size*(health_bar_offset_y+0.045),initial_camera_size*(((1-(health_bar_offset_x+(0.4)-health_border)))+(1-(health_bar_offset_x+health_border)-(1-(health_bar_offset_x+(0.4)-health_border)))*(p2fdcost/100)),initial_camera_size*(health_bar_offset_y+0.065),5 )

draw_set_alpha(1)