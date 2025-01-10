/// @description Insert description here
// You can write your code in this editor

select=0;

//Set the number of players required to exactly 2
input_join_params_set(2, 2, undefined, undefined);

//Start the JOIN source mode, enabling automatic device assignment
input_source_mode_set(INPUT_SOURCE_MODE.JOIN);

menu_options=[
	"Play",
	"Controls",
	"Credits"
]

submenu=0;
new_binding=[true,true]



control_connected=[false,false]

index=[0,0]

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

binded=[true,true]

input_ignore_key_add(vk_escape)
input_ignore_key_add(vk_f1)
input_ignore_key_add(vk_f2)
input_ignore_key_add(vk_f3)
input_ignore_key_add(vk_f4)

control_select=[0,0]

verbs=["up","left","down","right","summon","shoot","melee","dash","ultimate","fd"]
verb_display=["Up","Left","Down","Right","Summon Rock","Sonar Shot","Melee Attack","Dash","Special Summon","Faultless Defense"]

text_outline = function(){
	//x,y: Coordinates to draw
	//str: String to draw
	//arugment3 = outwidth: Width of outline in pixels
	//argument4 = outcol: Colour of outline (main text draws with regular set colour)
	//argument5 = outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)
	//argument6 = separation, for the draw_text_EXT command.
	//argument7 = width for the draw_text_EXT command.

	
	//2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
	var dto_dcol=draw_get_color();

	draw_set_color(argument4);

	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
	  //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
	  draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
	}

	draw_set_color(dto_dcol);

	draw_text_ext(argument0,argument1,argument2,argument6,argument7);	
	
	
}

draw_controls = function(_string, _y){
	_x=room_width/2-string_width(_string)/2
	for(i=0;i<string_length(_string);i++){
		draw_set_color(c_white)
		if(i==0 || i==1 || i==13  || i==14 || i==15 || i==16 || i==17 || i==18 || i==30 || i==31 || i==32 || i==33){		
			if(i==0){
				if(input_check("up",0) && input_check("up",1)){
					draw_set_color(#E0B0FF)
				}else if(input_check("up",0)){
					draw_set_color(c_aqua)
				}else if(input_check("up",1)){
					draw_set_color(c_red)
				}
			}
			if(i==1){
				if(input_check("down",0) && input_check("down",1)){
					draw_set_color(#E0B0FF)
				}else if(input_check("down",0)){
					draw_set_color(c_aqua)
				}else if(input_check("down",1)){
					draw_set_color(c_red)
				}
			}
			if(i>=13 && i<=18){
				if(input_check("summon",0) && input_check("summon",1)){
					draw_set_color(#E0B0FF)
				}else if(input_check("summon",0)){
					draw_set_color(c_aqua)
				}else if(input_check("summon",1)){
					draw_set_color(c_red)
				}
			}
			if(i>=30 && i<=33){
				if(input_check("dash",0) && input_check("dash",1)){
					draw_set_color(#E0B0FF)
				}else if(input_check("dash",0)){
					draw_set_color(c_aqua)
				}else if(input_check("dash",1)){
					draw_set_color(c_red)
				}
			}
		}
		text_outline(_x,_y,string_char_at(_string,i+1),1,c_black,8,30,100000);	
		_x+=string_width(string_char_at(_string,i+1))
	}
	
}