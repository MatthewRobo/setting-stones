/// @description Insert description here
// You can write your code in this editor

var player1 = targets[0];
var player2 = targets[1];

if (follow_target) {
	if (instance_exists(player1)) {
		player1coords = [player1.x, player1.y];
	}
	if (instance_exists(player2)) {
		player2coords = [player2.x, player2.y];
	}
	
	player_center = lerp(player_center, mean(player1coords[0], player2coords[0]), cam_lerp_t);
	player_middle = lerp(player_middle, mean(player1coords[1], player2coords[1]), cam_lerp_t);

	if (cam_wid_min > abs(player1coords[0] - player2coords[0]) + 150 * 2) {
		follow_offset_x = (cam_wid_min - abs(player1coords[0] - player2coords[0])) / 2;
	} else {
		follow_offset_x = 150;
	}
	if (cam_hei_min > abs(player1coords[1] - player2coords[1]) + 150 * 2) {
		follow_offset_y = (cam_hei_min - abs(player1coords[1] - player2coords[1])) / 2;
	} else {
		follow_offset_y = 150;
	}

	cam_x = lerp(
		cam_x,
		min(player1coords[0], player2coords[0]) - follow_offset_x,
		cam_lerp_t
	);
	cam_y = lerp(
		cam_y,
		min(player1coords[1], player2coords[1]) - follow_offset_y,
		cam_lerp_t
	);
	//cam_x = lerp(cam_x, min(player1coords[0],player2coords[0]) + follow_offset_x, cam_lerp_t);
	//cam_y = lerp(cam_y, min(player1coords[1],player2coords[1]) + follow_offset_y, cam_lerp_t);
	//constrain camera to room bounds
	cam_x = clamp(cam_x, 0, room_width - cam_wid);
	cam_y = clamp(cam_y, 0, room_height - cam_hei);

	cam_wid = lerp(
		cam_wid,
		max(
			abs(player1coords[0] - player2coords[0]) + follow_offset_x * 2,
			abs(player1coords[1] - player2coords[1]) + follow_offset_y * 2,
			cam_wid_min
		),
		cam_lerp_zoom_t
	);
	cam_hei = cam_wid;
}

//cam_x=0
//cam_y=0
//cam_wid=1500
//cam_hei=1500
var _cam_wid = cam_hei * 4 / 3;

cam_center = (cam_x + cam_wid) / 2;
cam_middle = (cam_y + cam_hei) / 2;


camera_set_view_size(global.cam, _cam_wid, cam_hei);
cam_x = player_center - _cam_wid / 2;
cam_y = player_middle - cam_hei / 2;
camera_set_view_pos(global.cam, cam_x + shake_x, cam_y + shake_y);

show_debug_message(cam_wid);
show_debug_message(cam_x);
show_debug_message(cam_y);

cam_center = (cam_x + cam_wid) / 2;
cam_middle = (cam_y + cam_hei) / 2;

layer_x("Background_1", cam_center * 0.5 - 2453 / 2);
layer_y("Background_1", cam_middle * 0.5 - 1635 / 2);
var _bgElem = layer_background_get_id("Background");
var _bgHmid = sprite_get_width(layer_background_get_sprite(_bgElem)) / 2;
var _bgVmid = sprite_get_height(layer_background_get_sprite(_bgElem)) / 2;
layer_x("Background", cam_center - _bgHmid);
layer_y("Background", cam_middle - _bgVmid);

cam_left = cam_x;
cam_top = cam_y;
cam_right = cam_x + _cam_wid;
cam_bottom = cam_y + cam_hei;
//
//if (global.hitstop > 0) {
	//layer_background_alpha(_bgElem, 0.2);
//} else {
	//layer_background_alpha(_bgElem, 1);
//}