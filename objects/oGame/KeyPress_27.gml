/// @desc Go To Menu

if (!audio_is_playing(snBeep)) audio_play_sound(snBeep, 5, false);
SlideTransition(TRANS_MODE.GOTO, rMenu);