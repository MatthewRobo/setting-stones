/// @description Insert description here
// You can write your code in this editor

//Set the number of players required to exactly 2
input_join_params_set(2, 2, "disconnect", undefined);

//Start the JOIN source mode, enabling automatic device assignment
input_source_mode_set(INPUT_SOURCE_MODE.JOIN);

input_ignore_key_add(vk_escape);
input_ignore_key_add(vk_f1);
input_ignore_key_add(vk_f2);


binded=[true,true]

index=[0,0]

new_binding=[true,true]
controls = [
	[input_binding_get("up",0), 
	input_binding_get("left",0), 
	input_binding_get("down",0), 
	input_binding_get("right",0), 
	input_binding_get("summon",0), 
	input_binding_get("shoot",0), 
	input_binding_get("melee",0), 
	input_binding_get("dash",0), 
	input_binding_get("ultimate",0), 
	input_binding_get("fd",0)],
	
	[input_binding_get("up",1), 
	input_binding_get("left",1), 
	input_binding_get("down",1), 
	input_binding_get("right",1), 
	input_binding_get("summon",1), 
	input_binding_get("shoot",1), 
	input_binding_get("melee",1), 
	input_binding_get("dash",1), 
	input_binding_get("ultimate",1), 
	input_binding_get("fd",1)]
];

verbs=["up","down","left","right","summon","shoot","melee","dash","ultimate","fd"]
verb_display=["Up","Down","Left","Right","Summon Rock","Sonar Shot","Melee Attack","Dash","Special Summon","Faultless Defense"]
