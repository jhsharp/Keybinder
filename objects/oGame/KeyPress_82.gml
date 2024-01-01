/// @desc Restart Room

if (!audio_is_playing(snDeath)) audio_play_sound(snDeath, 50, false);
SlideTransition(TRANS_MODE.GOTO, room);