for (var j = 0; j < array_length(summons); j++) {
	instance_destroy(summons[j]);
}
obj_game_manager.winner_triggered = true;
obj_game_manager.winner += 2 - player_number + 1;
audio_play_sound(sfx_dead, 0, false, 1);
part_particles_create(
	obj_particle_setup.particle_system,
	x,
	y,
	obj_particle_setup.particle_hitspark,
	1000
);

global.hitstop = max(20, global.hitstop);
game_set_speed(15, gamespeed_fps);
obj_game_manager.alarm[3] = 15;
