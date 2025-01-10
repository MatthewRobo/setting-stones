/// @description Insert description here
// You can write your code in this editor



draw_set_color(c_white)
//draw_circle(room_width/2,room_height/2,obj_game_manager.radius,true);
draw_circle_width(obj_game_manager.radius,10,360,1)

var hp_width=(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*((0.4+health_bar_offset_x-health_border)))-(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border))

// this shit is awful but i dont want to rewrite it all to fit draw gui
// i did it :)
////p1 hp bar
//draw_set_color(c_white)
//draw_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),false)
//draw_set_color(c_red)
//var p1hp=0;
//if(instance_exists(obj_player_1)){
//	p1hp=obj_player_1.hp	
	
//}else{
//	p1hp=0;	
//}

//if(p1hp>0){
//	draw_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1hp/10))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+health_border),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4-health_border),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05-health_border),false)
//}

////p2 hp bar

//draw_set_color(c_white)
//draw_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-health_bar_offset_x),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+0.4)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.07),false)
//draw_set_color(c_red)
//var p2hp=0;
//if(instance_exists(obj_player_2)){
//	p2hp=obj_player_2.hp	
	
//}else{
//	p2hp=0;	
//}

//if(p2hp>0){
//	draw_rectangle(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2hp/10)))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+health_border),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+(0.4)-health_border)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05-health_border),false)
//}

//////p1 stamina
////var p1stamina=0;
////if(instance_exists(obj_player_1)){
////	p1stamina=obj_player_1.stamina
	
////}else{
////	p1stamina=0;	
////}

////draw_set_color(c_green)
////if(p1stamina>0){
////	draw_rectangle(min(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1stamina/100))),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4-health_border)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+health_border+0.045),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4-health_border),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.055),false)
////}
//////p2 stamina

////var p2stamina=0;
////if(instance_exists(obj_player_2)){
////	p2stamina=obj_player_2.stamina
	
////}else{
////	p2stamina=0;	
////}
////draw_set_color(c_green)

////if(p2stamina>0){
////	draw_rectangle(max(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2stamina/100)))),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+(0.4)-health_border))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+health_border+0.045),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+(0.4)-health_border)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.055),false)
////}

////p1 meter
//var p1meter=0;
//if(instance_exists(obj_player_1)){
//	p1meter=obj_player_1.meter
	
//}else{
//	p1meter=0;	
//}

//var p1ultcost=0;
//if(instance_exists(obj_player_1)){
//	p1ultcost=obj_player_1.ultimate_cost
	
//}else{
//	p1ultcost=0;	
//}

//var p1fdcost=0;
//if(instance_exists(obj_player_1)){
//	p1fdcost=obj_player_1.fd_cost
	
//}else{
//	p1fdcost=0;	
//}

//if(p1meter>p1ultcost){
//	draw_set_color(c_blue)
//}else if (p1meter>p1fdcost){
//	draw_set_color(c_green)
//}else{
//	draw_set_color(c_purple)	
//}
//if(p1meter>0){
//	draw_rectangle(min(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1meter/100))),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4-health_border)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+0.4-health_border),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),false)
//}

//draw_set_color(c_black)


//draw_line_width(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1ultcost/100))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1ultcost/100))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),2 )


//draw_line_width(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1fdcost/100))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(health_bar_offset_x+health_border+(0.4*(1-p1fdcost/100))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),2 )


////p2 meter
//var p2meter=0;
//if(instance_exists(obj_player_2)){
//	p2meter=obj_player_2.meter
	
//}else{
//	p2meter=0;	
//}

//var p2fdcost=0;
//if(instance_exists(obj_player_2)){
//	p2fdcost=obj_player_2.fd_cost
	
//}else{
//	p2fdcost=0;	
//}

//var p2ultcost=0;
//if(instance_exists(obj_player_2)){
//	p2ultcost=obj_player_2.ultimate_cost
	
//}else{
//	p2ultcost=0;	
//}

//if(p2meter>p2ultcost){
//	draw_set_color(c_blue)
//}else if (p2meter>p2fdcost){
//	draw_set_color(c_green)
//}else{
//	draw_set_color(c_purple)	
//}


//if(p2meter>0){
//	draw_rectangle(max(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2meter/100)))),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+(0.4)-health_border))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+(0.4)-health_border)),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),false)
//}


//draw_set_color(c_black)


//draw_line_width(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2ultcost/100)))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2ultcost/100)))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),2 )


//draw_line_width(obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2fdcost/100)))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.05),obj_cam_ctrl.cam_x+obj_cam_ctrl.cam_wid*(1-(health_bar_offset_x+health_border+(0.4*(1-p2fdcost/100)))),obj_cam_ctrl.cam_y+obj_cam_ctrl.cam_hei*(health_bar_offset_y+0.065),2 )
