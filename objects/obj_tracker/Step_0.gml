if (instance_exists(summoner) && instance_exists(mine)) {
	color_base = summoner.color_slow;
	for (var i = 0; i < max_summon && i < array_length(summoner.summons); i++) {
		if (mine == summoner.summons[i]) {
			color = merge_color(color_base, c_black, i / max_summon);
			color_point = color;
			is_super = false;
			break;
		}
	}
	if (is_super) {
		color_base = summoner.color_fast;
		color = color_base;
	}
	//if (summoner.summons[0] == mine && array_length(summoner.summons) == summoner.max_summon) {
	//color = c_white;
	//}

	if (mine.shot) {
		//color = c_orange;
		color = color_base;
		color_point = c_white;
	} else if (
		summoner.shooting
		&& point_distance(mine.x, mine.y, summoner.x, summoner.y) > summoner.shoot_radius
	) {
		//color = c_white;
		color = merge_color(
			c_black,
			color_base,
			power(
				summoner.shoot_radius
					/ point_distance(mine.x, mine.y, summoner.x, summoner.y),
				2
			)
		);
	}
}
