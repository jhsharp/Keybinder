/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.shieldPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyShield = socket.key;
}