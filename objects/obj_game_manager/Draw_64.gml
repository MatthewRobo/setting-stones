/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(opacity)
draw_set_color(c_white)
draw_set_font(Font2)
draw_set_valign(fa_middle)
if(seconds<4){
	text_outline(750,750,ready_text[seconds],1,c_black,8,30,100000);
}

if(shrink && winner==0){
	text_outline(750,750,"HURRY UP!",1,c_black,8,30,100000);
}

draw_set_alpha(1)
if(winner>0){
	if(winner==3){
		text_outline(750,750,"DRAW",1,c_black,8,30,100000);
	}else{
		text_outline(750,750,"PLAYER "+string(winner)+" WINS!",1,c_black,8,30,100000);
	}
	
}

if(keyboard_check_pressed(vk_f4)){
	room_goto(menu)	
}

if(end_game){
	draw_set_font(Font1)
	text_outline(750,400,"Summon to rematch",1,c_black,8,30,100000);
	text_outline(750,500,"Dash to return to menu",1,c_black,8,30,100000);
	draw_set_color(colors[0])
	if (input_check_long("summon", 0))
    {
        text_outline(500,900,"Rematch",1,c_black,8,30,100000);
    }else if (input_check_long("dash", 0))
    {
        text_outline(500,900,"Return",1,c_black,8,30,100000);
    }
	
	draw_set_color(colors[1])
	if (input_check_long("summon", 1))
    {
        text_outline(1000,900,"Rematch",1,c_black,8,30,100000);
    }else if (input_check_long("dash", 1))
    {
        text_outline(1000,900,"Return",1,c_black,8,30,100000);
    }
}