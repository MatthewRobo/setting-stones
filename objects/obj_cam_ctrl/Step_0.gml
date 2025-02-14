/// @description Insert description here
// You can write your code in this editor

var player1 = targets[0];
var player2 = targets[1];
var _xdist = abs(player1coords[0] - player2coords[0]);
    var _ydist = abs(player1coords[1] - player2coords[1]);
	
if (follow_target && !round_start) {
	if (instance_exists(player1)) {
		player1coords = [player1.x, player1.y];
	}
	if (instance_exists(player2)) {
		player2coords = [player2.x, player2.y];
	} 

	var cam_wid_calc = max(
			abs(player1coords[0] - player2coords[0]) + follow_offset_x * 2,
			abs(player1coords[1] - player2coords[1]) + follow_offset_y * 2,
			cam_wid_min
		);
	var cam_hei_calc = cam_wid_calc;
	
	if (cam_wid_min > abs(player1coords[0] - player2coords[0]) + min_offset_x * 2) {
        follow_offset_x = (cam_wid_min - abs(player1coords[0] - player2coords[0])) / 2;
    } else {
        //follow_offset_x = (cam_wid_calc - abs(player1coords[0] - player2coords[0])) / 2;
    }
    if (cam_hei_min > abs(player1coords[1] - player2coords[1]) + min_offset_y * 2) {
        follow_offset_y = (cam_hei_min - abs(player1coords[1] - player2coords[1])) / 2;
    } else {
        //follow_offset_y = (cam_hei_calc - abs(player1coords[1] - player2coords[1])) / 2;
    }


	if(abs(player1coords[0] - player2coords[0]) + follow_offset_x * 2 < cam_wid_min){
		cam_x = lerp(
			cam_x,
			min(player1coords[0], player2coords[0]) - follow_offset_x,
			cam_lerp_t
		);
	}else{
		cam_x=lerp(cam_x, min(player1coords[0], player2coords[0]) - (cam_wid-_xdist)/2, cam_lerp_t)
	}
	if(abs(player1coords[1] - player2coords[1]) + follow_offset_y * 2 < cam_hei_min){
		cam_y = lerp(
			cam_y,
			min(player1coords[1], player2coords[1]) - follow_offset_y,
			cam_lerp_t
		);
	}else{
		
		cam_y=lerp(cam_y, min(player1coords[1], player2coords[1]) - (cam_hei-_ydist)/2, cam_lerp_t)
	}
	//cam_x = lerp(cam_x, min(player1coords[0],player2coords[0]) + follow_offset_x, cam_lerp_t);
	//cam_y = lerp(cam_y, min(player1coords[1],player2coords[1]) + follow_offset_y, cam_lerp_t);
	//constrain camera to room bounds
	cam_x = clamp(cam_x, 0, room_width - cam_wid);
	cam_y = clamp(cam_y, 0, room_height - cam_hei);

	cam_wid = lerp(
		cam_wid,
		max(
			abs(player1coords[0] - player2coords[0]) + follow_offset_x * 2,
			
			cam_wid_min
		),
		cam_lerp_zoom_t
	);
	cam_hei = lerp(
		cam_hei,
		max(
			abs(player1coords[1] - player2coords[1]) + follow_offset_y * 2,
			cam_hei_min
		),
		cam_lerp_zoom_t
	);
	
	cam_hei=max(cam_hei,cam_wid);
	cam_wid=max(cam_hei,cam_wid);
}

//cam_x=0
//cam_y=0
//cam_wid=1500
//cam_hei=1500

if(round_start){
	if (instance_exists(player1)) {
		player1coords = [player1.x, player1.y];
	}
	if (instance_exists(player2)) {
		player2coords = [player2.x, player2.y];
	} 
	
	cam_wid = max(
			abs(player1coords[0] - player2coords[0]) + follow_offset_x * 2,
			
			cam_wid_min
		)
	cam_hei = max(
			abs(player1coords[1] - player2coords[1]) + follow_offset_y * 2,
			cam_hei_min
		)
	
	cam_hei=max(cam_hei,cam_wid);
	cam_wid=max(cam_hei,cam_wid);
	cam_x=min(player1coords[0], player2coords[0]) - follow_offset_x
	cam_y=min(player1coords[1], player2coords[1]) - (cam_hei-_ydist)/2
	round_start=false;
	show_debug_message("cam")
	show_debug_message(cam_x);
	show_debug_message(cam_y);
}
camera_set_view_size(global.cam, cam_wid, cam_hei);
camera_set_view_pos(global.cam, cam_x + shake_x, cam_y + shake_y);

//show_debug_message(cam_wid);
//show_debug_message(cam_x);
//show_debug_message(cam_y);

cam_center = (cam_x + cam_wid) / 2;
cam_middle = (cam_y + cam_hei) / 2;

layer_x("Background_1", cam_center * 0.5 - 2453 / 2);
layer_y("Background_1", cam_middle * 0.5 - 1635 / 2);

layer_x("Background", - (room_width / 2) + cam_center * 0.99 - 2453 / 2);
layer_y("Background", - (room_height / 2) + cam_middle * 0.99 - 1635 / 2);
