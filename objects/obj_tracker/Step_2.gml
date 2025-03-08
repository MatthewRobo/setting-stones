if (instance_exists(summoner) && instance_exists(mine)) {
	color_base = summoner.color_slow;
	for (var i = 0; i < min(max_summon, array_length(summoner.summons)); i++) {
		if (mine == summoner.summons_reverse[i]) {
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
		if (!was_shot) {
			color = c_white;
			color_point = c_white;
			base_alpha = 0.5;
		} else {
			color = merge_color(color, color_base, 0.12);
			color_point = merge_color(color_point, color_base, 0.12);
			base_alpha = lerp(base_alpha, 0.1, 0.12);
		}
		was_shot = true;

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
