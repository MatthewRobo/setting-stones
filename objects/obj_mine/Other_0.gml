if (state == mine_states.LAUNCHED) {
	if (x < 0 && xspd < 0 || y < 0 && yspd < 0 || x > room_width && xspd > 0 || y > room_height && yspd > 0) {
		instance_destroy();
	}
}