/// @description Insert description here
// You can write your code in this editor

active = true;
shift_ratio = 0;

if (instance_exists(summoner)) {
	if (!summoner.actionable) {
		alarm[0] = 1;
		active = false;
	}
}
