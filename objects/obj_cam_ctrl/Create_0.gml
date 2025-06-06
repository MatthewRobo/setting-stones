/// @description Insert description here
// You can write your code in this editor

view_enabled = true;
view_visible[0] = true;
global.cam = view_camera[view_current];

cam_wid = 2000;
cam_hei = 2000;

cam_wid_min = 500;
cam_hei_min = 500;

shake_amt = 0;
shake_dur = 0;

shake_x = 0;
shake_y = 0;

follow_target = true;
targets = obj_game_manager.players;

cam_x = 0;
cam_y = 0;
follow_offset_x = 200;
follow_offset_y = 200;
min_offset_x = 150;
min_offset_y = 150;
cam_lerp_t = 0.2;
cam_lerp_zoom_t = 0.2;

player1coords = [0, 0];
player2coords = [0, 0];

player_center = room_width / 2;
player_middle = room_height / 2;


cam_center = (cam_x + cam_wid) / 2;
cam_middle = (cam_y + cam_hei) / 2;

round_start = true;

cam_left = cam_x;
cam_top = cam_y;
cam_right = cam_x + cam_wid;
cam_bottom = cam_y + cam_hei;