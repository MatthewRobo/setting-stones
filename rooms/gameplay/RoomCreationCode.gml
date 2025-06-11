randomize();
show_debug_message(random_get_seed());

for (var player = 0; player < 2; player++) {
	input_verb_consume("summon", player);
}