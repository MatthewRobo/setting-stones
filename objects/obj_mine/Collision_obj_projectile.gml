/// @description Insert description here
// You can write your code in this editor
if(self.summoner!=other.summoner){
	hp-=1;
}
if(hp==0){
	try{
		for(i=0;i<array_length(summoner_original.summons);i++){	
			if(summoner_original.summons[i]==id){
				array_delete(summoner_original.summons,i,1);
				summoner_original.current_summon-=1;
				break;
			
			}
		}
	}catch(_exception){
			
	}
	instance_destroy(tracker)
	instance_destroy()	
}