/// @description Insert description here
// You can write your code in this editor
health_bar_offset_x=0.05
health_bar_offset_y=0.01

health_border=0.005

meter_offset_y=0.01
meter_offset_x=0.025
initial_camera_size=1500;


alpha=[1,1]


draw_circle_width= function(inner_radius, width, segment, percentage){

		var radius = argument[0];
		var thickness = argument[1];
		var segments = argument[2];
		var jadd = 360/segments;
		if(obj_game_manager.shrink){
			draw_set_color(#D100D1);
		}else{
			draw_set_color(c_white);
		}
		draw_primitive_begin(pr_trianglestrip);
		for (var j = 0; j <= 360*percentage; j+=jadd)
		{
		    draw_vertex(room_width/2-lengthdir_x(radius,j),room_height/2+lengthdir_y(radius,j));


		  draw_vertex(room_width/2-lengthdir_x(radius+thickness,j),room_height/2+lengthdir_y(radius+thickness,j));
		    }
		draw_primitive_end();
}