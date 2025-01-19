// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
	return {
		keyboard_and_mouse:
		{
			up:    input_binding_key(vk_up),
			down:  input_binding_key(vk_down),
			left:  input_binding_key(vk_left),
			right: input_binding_key(vk_right),
			
			accept: [input_binding_key(ord("Z")), input_binding_key(vk_enter)],
			cancel:  input_binding_key(ord("X")),
			rebind:  input_binding_key(ord("C")),
			
			summon: input_binding_key(ord("Z")),
			shoot:  input_binding_key(ord("X")),
			melee:  input_binding_key(ord("A")),
			dash:   input_binding_key(vk_shift),
			ultimate: input_binding_key(ord("C")),
			fd:     input_binding_key(ord("S")),
			
			pause: input_binding_key(vk_escape),
		},
		
		gamepad:
		{
			up:    [input_binding_gamepad_button(gp_padu), input_binding_gamepad_axis(gp_axislv, true)],
			down:  [input_binding_gamepad_button(gp_padd), input_binding_gamepad_axis(gp_axislv, false)],
			left:  [input_binding_gamepad_button(gp_padl), input_binding_gamepad_axis(gp_axislh, true)],
			right: [input_binding_gamepad_button(gp_padr), input_binding_gamepad_axis(gp_axislh, false)],
			
			accept:  input_binding_gamepad_button(gp_face1),
			cancel:  input_binding_gamepad_button(gp_face2),
			rebind:  input_binding_gamepad_button(gp_face4),

			summon:  input_binding_gamepad_button(gp_face3),
			shoot: input_binding_gamepad_button(gp_face4),
			melee: input_binding_gamepad_button(gp_face1),
			dash: input_binding_gamepad_button(gp_shoulderr),
			ultimate: input_binding_gamepad_button(gp_shoulderrb),
			fd: input_binding_gamepad_button(gp_face2),
			
			pause: input_binding_gamepad_button(gp_start),
		},
	};
}
