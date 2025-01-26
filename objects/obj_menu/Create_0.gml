/// @description Insert description here
// You can write your code in this editor

enum menu_states {
	MAIN_MENU,
	CONTROLLER_ASSIGN,
	CONTROLLER_BINDING,
	CREDITS,
}

menuState = menu_states.MAIN_MENU;

enum main_options {
	PLAY,
	CREDITS,
	EXIT,
}

mainDisplay = ["PLAY", "CREDITS", "EXIT"];

enum controls_options {
	UP,
	LEFT,
	DOWN,
	RIGHT,
	SUMMON,
	SHOOT,
	MELEE,
	DASH,
	ULTIMATE,
	FD,
	ACCEPT,
	CANCEL,
	//REBIND,
	//PAUSE,
	RESET,
	DONE,
}

verbs = [
	"up",
	"left",
	"down",
	"right",
	"summon",
	"shoot",
	"melee",
	"dash",
	"ultimate",
	"fd",
	"accept",
	"cancel"
	//"rebind",
	//"pause",
];

verbDisplay = [
	"Up",
	"Left",
	"Down",
	"Right",
	"Set Stone",
	"Send Stones",
	"Melee",
	"Dash",
	"Super",
	"Shield",
	"Menu Accept",
	"Menu Cancel",
	//"Menu 3",
	//"Start",
	"Reset to Default",
	"Ready"
];

function indexToCoord(_index, _height, _menu) {
	switch (_menu) {
		case menu_states.MAIN_MENU:
			return _height * 0.625 + 100 * _index;
	}
}

mainCursor = 0;
lerpMainCursor = mainCursor;
menuWidth = 1;
lerpMenuWidth = 0;
#macro menu_lerp_factor 0.4

controllerAssign = [-1, -1];
controllerAssignReady = [false, false];
bindCursor = [controls_options.SUMMON, controls_options.SUMMON];
is_binding = [false, false];
bindReady = [false, false];
cursorVerb = [verbs[controls_options.SUMMON], verbs[controls_options.SUMMON]];

inputLock = [false, false];
#macro inputLockTime 5

// the amount of players is the number of controllers, we'll resolve this later
input_join_params_set(1, INPUT_MAX_PLAYERS);

//Start the JOIN source mode, enabling automatic device assignment
input_source_mode_set(INPUT_SOURCE_MODE.JOIN);

input_ignore_key_add(vk_escape);
input_ignore_key_add(vk_f1);
input_ignore_key_add(vk_f2);
input_ignore_key_add(vk_f3);
input_ignore_key_add(vk_f4);

get_player_direction_inputs = function(playerIndex) {
	var _bindings = [];
	var _directions = ["up", "left", "down", "right"];
	for (var i = 0; i < array_length(_directions); i++) {
		for (var j = 0; j < INPUT_MAX_ALTERNATE_BINDINGS; j++) {
			_bindings += input_binding_get_name(
				input_binding_get(_directions[i], playerIndex, j)
			);
		}
	}

	return _bindings;
};

clouds = [256];
for (var i = 0; i < array_length(clouds); i++) {}

//ParticleSystem1
psys_clouds = part_system_create_layer("Particles", false);
part_system_draw_order(psys_clouds, false);

//Emitter
ptype_cloud = part_type_create();
part_type_sprite(ptype_cloud, spr_pentagon, false, true, false);
part_type_size(ptype_cloud, 0, 0, 0.08, 0);
part_type_scale(ptype_cloud, 0.11, 0.11);
part_type_speed(ptype_cloud, 2, 4, 0, 0);
//part_type_direction(_ptype1, 90, 90, 0, 0);
//part_type_gravity(_ptype1, 0.2, 270);
part_type_orientation(ptype_cloud, 0, 360, 0, 0, false);
//part_type_colour3(ptype_cloud, $FFFFFF, $FFFFDB, $D4B7A3);
part_type_alpha3(ptype_cloud, 1, 1, 1);
part_type_blend(ptype_cloud, false);
part_type_life(ptype_cloud, 90, 120);

part_system_position(psys_clouds, room_width / 2, room_height * 0.66);

function create_clouds() {
	var _t = abs(1 - ((global.ANIMATION_TIMER * 0.025) % 1));
	var _color = merge_color(c_white, #9acbf6, sqrt(_t));
	part_type_color3(ptype_cloud, #0081f6, _color, _color);
	var _ratio = 1;
	var _grv = 1.4;

	repeat (4) {
		var _rand = random(1);
		var _x = room_width * (0.5 - _rand);
		var _y = -200 * abs(power(lerp(-1, 1, _rand), 5));
		var _rand2 = lerp(-_ratio, _ratio, _rand);

		//var _dir = point_direction(0, 0, -_rand2, 1);
		var _dir = point_direction(0, -560, _x, _y);

		//var _grv = point_distance(0, 0, _ratio/2, 1);

		var _dx = lerp(-50, 50, random(1));
		var _dy = lerp(-20, 20, random(1));

		part_type_size(ptype_cloud, 0, 0.05, 0.12 * _grv, 0);
		if (irandom(100) > 99) {
			part_type_size(ptype_cloud, 0, 2, 0.12 * _grv, 0);
		}
		part_type_speed(ptype_cloud, 0, 0, _grv * 0.2, 0);
		part_type_direction(ptype_cloud, _dir, _dir, 0, 0);

		//part_type_color1(_ptype1, merge_color(c_white, #9acbf6, sqrt(_t)));
		part_particles_create(psys_clouds, _x + _dx, _y + _dy, ptype_cloud, 1);
	}
}

repeat (60) {
	create_clouds();
	global.ANIMATION_TIMER++;
	part_system_update(psys_clouds);
}

