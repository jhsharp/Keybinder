/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.leftPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyLeft = socket.key;
}