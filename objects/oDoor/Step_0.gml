/// @desc Transport Player to Next Level

if place_meeting(x, y, oPlayer) {
	if (!audio_is_playing(snDoor)) audio_play_sound(snDoor, 50, false);
	with (oPlayer) instance_destroy();
	SlideTransition(TRANS_MODE.GOTO, target);
}