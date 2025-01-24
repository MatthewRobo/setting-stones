/// @description Insert description here
// You can write your code in this editor
if (input_join_is_finished() && !input_player_ghost_get(0) && !input_player_ghost_get(1)) {
	if (input_check_long("summon", 0) && input_check_long("summon", 1)) {
		input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
		room_goto(gameplay);
	}
}

controls = [
	[
		input_binding_get("up", 0),
		input_binding_get("left", 0),
		input_binding_get("down", 0),
		input_binding_get("right", 0),
		input_binding_get("summon", 0),
		input_binding_get("shoot", 0),
		input_binding_get("melee", 0),
		input_binding_get("dash", 0),
		input_binding_get("ultimate", 0),
		input_binding_get("fd", 0)
	],
	[
		input_binding_get("up", 1),
		input_binding_get("left", 1),
		input_binding_get("down", 1),
		input_binding_get("right", 1),
		input_binding_get("summon", 1),
		input_binding_get("shoot", 1),
		input_binding_get("melee", 1),
		input_binding_get("dash", 1),
		input_binding_get("ultimate", 1),
		input_binding_get("fd", 1)
	]
];
