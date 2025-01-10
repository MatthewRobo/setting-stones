/// @description Insert description here
// You can write your code in this editor
try{
	if(other.id!=summoner && active){
	
		for(i=0;i<array_length(summoner.summons);i++){	
			if(summoner.summons[i]==id){
				array_delete(summoner.summons,i,1);
				summoner.current_summon-=1;
				break;
			}
		
		}
		instance_destroy(tracker)
		instance_destroy()
	}
	if(!active){
	
	}
}catch(_exception){
	
}