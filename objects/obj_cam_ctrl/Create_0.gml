/// @description Insert description here
// You can write your code in this editor

view_enabled=true
view_visible[0] = true;
global.cam = view_camera[view_current];

cam_wid = 500
cam_hei = 500

cam_wid_min=500
cam_hei_min=500

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
cam_lerp_t = .2;
cam_lerp_zoom_t=0.5;

