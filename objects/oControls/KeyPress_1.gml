if (image_index == image_number - 1) {
	SlideTransition(TRANS_MODE.GOTO, target);
	sprite_index = sLaserOff;
}
image_index += 1;
