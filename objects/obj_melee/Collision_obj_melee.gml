/// @description Insert description here
// You can write your code in this editor
if(self.summoner!=other.summoner){
	try{
		var _direction=point_direction(other.x,other.y,self.x,self.y)
	
		self.summoner.push_xspd=lengthdir_x(self.summoner.push_distance/2,_direction)
		self.summoner.push_yspd=lengthdir_y(self.summoner.push_distance/2,_direction);
	}catch(_exception){
		
	}
}