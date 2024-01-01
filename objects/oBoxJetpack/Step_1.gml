/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.jetpackPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyJetpack = socket.key;
}