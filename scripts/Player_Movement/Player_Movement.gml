// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//function decelerate(_amt)
//{
	//var prev_sign = sign(xspd);
	//xspd -= prev_sign * _amt;
	//if (sign(xspd) != prev_sign){
		//xspd = 0;	
	//}
//}

function decelerate_push(_amt)
{
	var _dir = point_direction(0, 0, push_xspd, push_yspd);
	var prev_sign = sign(push_xspd);
	push_xspd -= lengthdir_x(_amt, _dir);
	if (sign(push_xspd) != prev_sign){
		push_xspd = 0;	
	}
	
	prev_sign = sign(push_yspd);
	push_yspd -= lengthdir_y(_amt, _dir);
	if (sign(push_yspd) != prev_sign){
		push_yspd = 0;	
	}
}

function move_collide(){
	
		
	//iterate through each possible pixel of movement and check for platforms
	for (var i = 0; i < abs(xspd); i++){
		if !place_meeting(x + sign(xspd), y, obj_platform){
			x += sign(xspd);
		} else {
			xspd = 0;	
		}
	}

	for (var i = 0; i < abs(yspd); i++){
		if !place_meeting(x, y + sign(yspd), obj_platform){
			y += sign(yspd);
		} else {
			yspd = 0;	
		}
	}
}

function normalise_speed(){
	var totalSpeed = xspd * xspd + yspd * yspd;
	if(totalSpeed > maxspeed * maxspeed){
	    var dir = point_direction(0,0,xspd,yspd);
	    xspd = lengthdir_x(maxspeed, dir);
	    yspd = lengthdir_y(maxspeed, dir);
	}
	
}


function normalise_speed_diff(maxspd){
	var totalSpeed = xspd * xspd + yspd * yspd;
	if(totalSpeed > maxspd * maxspd){
	    var dir = point_direction(0,0,xspd,yspd);
	    xspd = lengthdir_x(maxspd, dir);
	    yspd = lengthdir_y(maxspd, dir);
	}
	
}

function move_radius(){
	
	
	x+=xspd;
	y+=yspd;
	
	x+=push_xspd
	y+=push_yspd
	vector_dir = point_direction( room_width/2,room_height/2,x, y)
	if(point_distance(x,y,room_width/2,room_height/2)>obj_game_manager.radius){
		x=room_width/2+lengthdir_x(obj_game_manager.radius,vector_dir)
		y=room_height/2+lengthdir_y(obj_game_manager.radius,vector_dir)
	}
}

