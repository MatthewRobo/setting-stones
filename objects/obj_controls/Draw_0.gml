/// @description Insert description here
// You can write your code in this editor

draw_set_font(Font1);
draw_set_halign(fa_center);
if (input_player_connected(0)) {
	draw_text(750, 50, "Player 1 Connected");

	if (input_player_using_keyboard(0)) {
		draw_text(300, 200, "WASD - Move");
		draw_text(750, 200, "R - Summon Mine\nT - Shoot Mine\nY - Melee Attack");
		draw_text(1200, 200, "F - Dash\nG - Mass Summon\nH - Faultless Defense");
		draw_text(750, 500, "Hold Enter to ready up");
	}
	if (input_player_using_gamepad(0)) {
		draw_text(300, 200, "Joystick - Move");
		draw_text(750, 200, "B - Summon Mine\nA - Shoot Mine\nY - Melee Attack");
		draw_text(1200, 200, "X - Dash\nL - Mass Summon\nR - Faultless Defense");
		draw_text(750, 500, "Hold Start to ready up");
	}
	if (input_check_long("confirm", 0)) {
		draw_text(750, 600, "READY!");
	}
} else {
	draw_text(750, 50, "Waiting for Player 1");
}

if (input_player_connected(1)) {
	draw_text(750, 800, "Player 2 Connected");
	if (input_player_using_keyboard(1)) {
		draw_text(300, 950, "WASD - Move");
		draw_text(750, 950, "R - Summon Mine\nT - Shoot Mine\nY - Melee Attack");
		draw_text(1200, 950, "F - Dash\nG - Mass Summon\nH - Faultless Defense");
		draw_text(750, 1250, "Hold Enter to ready up");
	}
	if (input_player_using_gamepad(1)) {
		draw_text(300, 950, "Joystick - Move");
		draw_text(750, 950, "B - Summon Mine\nA - Shoot Mine\nY - Melee Attack");
		draw_text(1200, 950, "X - Dash\nL - Mass Summon\nR - Faultless Defense");
		draw_text(750, 1250, "Hold Start to ready up");
	}
	if (input_check_long("confirm", 1)) {
		draw_text(750, 1350, "READY!");
	}
} else {
	draw_text(750, 800, "Waiting for Player 2");
}
