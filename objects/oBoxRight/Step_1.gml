/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.rightPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyRight = socket.key;
}