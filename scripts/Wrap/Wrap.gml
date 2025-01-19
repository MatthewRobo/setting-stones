function wrap(min, max, value){ // this is some garbage lazy shit
	var _range = max - min;
	while (value < min) {
		value += _range + 1;
	}
	while (value > max) {
		value -= _range + 1;
	}
	return value;
}