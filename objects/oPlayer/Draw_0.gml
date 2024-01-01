/// @desc Draw Shield

draw_self();
if (shield) {
	if (image_xscale > 0) draw_sprite(sPlayerShield, 0, x, y);
	else draw_sprite(sPlayerShield, 1, x, y);
}