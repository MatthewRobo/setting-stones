/// @description Insert description here
// You can write your code in this editor

if(submenu==0){
	draw_set_font(Font2)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	text_outline(750,300,"Pebble Panic",1,c_black,8,30,100000);
	draw_set_font(Font1)
	for(i=0;i<array_length(menu_options);i++){
		if(select==i){
			if(input_check("summon",0)){
				draw_set_color(c_aqua)
			}else if (input_check("summon",1)){
				draw_set_color(c_red)
			}
			
			draw_triangle(500,650+100*i-30,500,650+100*i+30,550,650+100*i,false)	
		}
		draw_set_color(c_white)
		text_outline(750,650+100*i,menu_options[i],1,c_black,8,30,100000);	
	}
	
}

if(submenu==1){
	if(input_player_connected(0) && array_length(input_source_get_array(0))>0){
			text_outline(375,50,"P1 Connected",1,c_black,8,30,100000);	
		if(binded[0]){
			draw_set_color(c_aqua)
			draw_triangle(25,175+75*(control_select[0]+10)-30,25,175+75*(control_select[0]+10)+30,75,175+75*(control_select[0]+10),false)
			draw_set_color(c_white)
		}else{
			draw_set_color(c_aqua)
			draw_triangle(25,175+75*(index[0])-30,25,175+75*(index[0])+30,75,175+75*(index[0]),false)
			draw_set_color(c_white)
			if(new_binding[0]){
				new_binding[0]=false
				input_binding_scan_start(function(_new) {
					if(!binded[0]){
						input_binding_set_safe(verbs[index[0]], _new,0);
						new_binding[0]=true
					
						index[0]+=1
						if(index[0]==array_length(verbs)){
							
							binded[0]=true	
						}
						
					}
				}, function(){},0);
			
			
			}
		}
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		if(input_player_using_keyboard(0)){
			text_outline(100,150,global._fhinputKeys[controls[0][0].__value]+" - Up\n"+global._fhinputKeys[controls[0][1].__value]+" - Left\n"+global._fhinputKeys[controls[0][2].__value]+" - Down\n"+global._fhinputKeys[controls[0][3].__value]+" - Right\n"+global._fhinputKeys[controls[0][4].__value]+" - Summon Rock\n"+global._fhinputKeys[controls[0][5].__value]+" - Sonar Shot\n"+global._fhinputKeys[controls[0][6].__value]+" - Melee Attack\n"+global._fhinputKeys[controls[0][7].__value]+" - Dash\n"+global._fhinputKeys[controls[0][8].__value]+" - Mass Summon\n"+global._fhinputKeys[controls[0][9].__value]+" - Defend",1,c_black,8,75,100000);	
		}
		if(input_player_using_gamepad(0)){	
			text_outline(100,150,string_replace_all(controls[0][0],"gamepad ","")+" - Up\n"+string_replace_all(controls[0][1],"gamepad ","")+" - Left\n"+string_replace_all(controls[0][2],"gamepad ","")+" - Down\n"+string_replace_all(controls[0][3],"gamepad ","")+" - Right\n"+string_replace_all(controls[0][4],"gamepad ","")+" - Summon Rock\n"+string_replace_all(controls[0][5],"gamepad ","")+" - Sonar Shot\n"+string_replace_all(controls[0][6],"gamepad ","")+" - Melee Attack\n"+string_replace_all(controls[0][7],"gamepad ","")+" - Dash\n"+string_replace_all(controls[0][8],"gamepad ","")+" - Mass Summon\n"+string_replace_all(controls[0][9],"gamepad ","")+" - Defend",1,c_black,8,75,100000);	
		}
			
		draw_set_font(Font1)
		draw_text(100,900,"Rebind")
		draw_text(100,975,"Reset")
		draw_text(100,1050,"Disconnect")

	
	}else{
		draw_text(375,50,"Waiting for Player 1")
	}	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_middle)
	if(input_player_connected(1) && array_length(input_source_get_array(1))>0){
		draw_set_halign(fa_middle)
		draw_set_valign(fa_middle)
		draw_text(1125,50,"P2 Connected")
		if(binded[1]){
			draw_set_color(c_red)
			draw_triangle(775,175+75*(control_select[1]+10)-30,775,175+75*(control_select[1]+10)+30,825,175+75*(control_select[1]+10),false)
			draw_set_color(c_white)
		}else{
			draw_set_color(c_red)
			draw_triangle(775,175+75*(index[1])-30,775,175+75*(index[1])+30,825,175+75*(index[1]),false)
			draw_set_color(c_white)
			if(new_binding[1]){
				new_binding[1]=false
				input_binding_scan_start(function(_new) {
					if(!binded[1]){
						input_binding_set_safe(verbs[index[1]], _new,1);
						new_binding[1]=true
					
						index[1]+=1
						if(index[1]==array_length(verbs)){
							binded[1]=true	
						}
					}
				}, function(){},1);
			
			
			}
		}
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		if(input_player_using_keyboard(1)){

			text_outline(850,150,global._fhinputKeys[controls[1][0].__value]+" - Up\n"+global._fhinputKeys[controls[1][1].__value]+" - Left\n"+global._fhinputKeys[controls[1][2].__value]+" - Down\n"+global._fhinputKeys[controls[1][3].__value]+" - Right\n"+global._fhinputKeys[controls[1][4].__value]+" - Summon Rock\n"+global._fhinputKeys[controls[1][5].__value]+" - Sonar Shot\n"+global._fhinputKeys[controls[1][6].__value]+" - Melee Attack\n"+global._fhinputKeys[controls[1][7].__value]+" - Dash\n"+global._fhinputKeys[controls[1][8].__value]+" - Mass Summon\n"+global._fhinputKeys[controls[1][9].__value]+" - Defend",1,c_black,8,75,100000);		 
		}
		if(input_player_using_gamepad(1)){
		
			text_outline(850,150,string_replace_all(controls[1][0],"gamepad ","")+" - Up\n"+string_replace_all(controls[1][1],"gamepad ","")+" - Left\n"+string_replace_all(controls[1][2],"gamepad ","")+" - Down\n"+string_replace_all(controls[1][3],"gamepad ","")+" - Right\n"+string_replace_all(controls[1][4],"gamepad ","")+" - Summon Rock\n"+string_replace_all(controls[1][5],"gamepad ","")+" - Sonar Shot\n"+string_replace_all(controls[1][6],"gamepad ","")+" - Melee Attack\n"+string_replace_all(controls[1][7],"gamepad ","")+" - Dash\n"+string_replace_all(controls[1][8],"gamepad ","")+" - Mass Summon\n"+string_replace_all(controls[1][9],"gamepad ","")+" - Defend",1,c_black,8,75,100000);		 
		}
		draw_set_font(Font1)
		draw_text(850,900,"Rebind")
		draw_text(850,975,"Reset")
		draw_text(850,1050,"Disconnect")
	}else{
		draw_text(1125,50,"Waiting for Player 2")
	}
		
	draw_set_halign(fa_middle)
	draw_set_valign(fa_middle)

}

if(submenu==2){
	draw_set_font(Font2)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	text_outline(750,150,"Credits",1,c_black,8,30,100000);
	draw_set_font(Font2_small)
	text_outline(750,350,"Programming",1,c_black,8,30,100000);
	draw_set_font(Font1)
	text_outline(750,450,"Nick Pham",1,c_black,8,30,100000);
	draw_set_font(Font2_small)
	text_outline(750,600,"Music",1,c_black,8,30,100000);
	draw_set_font(Font1)
	text_outline(750,700,"v1ris",1,c_black,8,30,100000);
	draw_set_font(Font2_small)
	text_outline(750,850,"Special Thanks",1,c_black,8,30,100000);
	draw_set_font(Font1)
	draw_set_valign(fa_top)
	text_outline(750,950,"Matthew Nguyen\nMarcos Felipe Wang\nKamron Farrokh\nThe SoCal Fighting Game Community",1,c_black,8,100,100000);
	
}
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_controls("↑↓ - Select		Summon - Select		Dash - Back", 1450)
draw_set_halign(fa_center)