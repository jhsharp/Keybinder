/// @desc Activation

if (global.yellowActive) image_index = 1;
else image_index = 0;

if place_meeting(x, y, oFireball) {
	global.yellowActive = !global.yellowActive;
	with (instance_nearest(x, y, oFireball)) instance_destroy();
	audio_play_sound(snSwitch, 25, false);
}