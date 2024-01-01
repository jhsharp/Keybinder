/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.runPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyRun = socket.key;
}