/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.pullPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyPull = socket.key;
}
