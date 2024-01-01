/// @desc Manage Music

if (room == rMenu) || (room == rControls)
{
	if !audio_is_playing(snMenu) audio_play_sound(snMenu, 5, true);	
	if audio_is_playing(snShield) audio_stop_sound(snShield);
}
else audio_stop_sound(snMenu);

if (room == rCredits)
{
	if !audio_is_playing(snCredits) audio_play_sound(snCredits, 5, true);
	if audio_is_playing(snShield) audio_stop_sound(snShield);
}
else audio_stop_sound(snCredits);

if (room != rInitialize) && (room != rMenu) && (room != rControls) && (room != rCredits)
{
	if !audio_is_playing(global.areaMusic) audio_play_sound(global.areaMusic, 5, true);
}
else audio_stop_sound(global.areaMusic);

if ((global.areaMusic != snArea1) && (audio_is_playing(snArea1))) audio_stop_sound(snArea1);
if ((global.areaMusic != snArea2) && (audio_is_playing(snArea2))) audio_stop_sound(snArea2);
if ((global.areaMusic != snArea3) && (audio_is_playing(snArea3))) audio_stop_sound(snArea3);