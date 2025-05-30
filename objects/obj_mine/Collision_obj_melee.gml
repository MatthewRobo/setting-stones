/// @description Insert description here
// You can write your code in this editor

active = true;

try {
	if (other != last_melee) {
        state = mine_states.MELEED;
		if (xspd == 0 && yspd == 0) {
			self.summoner = other.summoner;
			self.target = other.target;
			self.color = summoner.color;
			self.tracker.summoner = self.summoner;
			shoot_melee(other);
		} else {
			xspd = 0;
			yspd = 0;
			if (other.summoner != self.summoner) {
				summoner.meter += 10;
			}
			self.summoner = other.summoner;
			self.target = other.target;
			self.color = summoner.color;
			self.tracker.summoner = self.summoner;
			try {
				direction = point_direction(x, y, target.x, target.y);
			} catch (_exception) {
				direction = point_direction(x, y, x + 1, y);
			}
			image_angle = direction;
			xaccel = lengthdir_x(accel, direction);
			yaccel = lengthdir_y(accel, direction);
			//hp=1;
			shot = true;
			audio_play_sound(sfx_reflect, 0, false, 2);
		}
		last_melee = other;
	}
} catch (_exception) {}
