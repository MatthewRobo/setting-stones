/// @description Insert description here
// You can write your code in this editor
radius=room_width*0.4
opacity=1
players=[instance_find(obj_player_1,0),instance_find(obj_player_2,0)]

seconds=0;
alarm[0]=60
ready_text=["3","2","1","GO!"]

winner_triggered=false;
winner=0;

end_game=false;

radius_initial=room_width*0.4
radius_minimum=300;
shrink=false;

alarm[2]=20*60
audio_play_sound(sfx_countdown,0,false)

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