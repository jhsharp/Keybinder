/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.interactPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyInteract = socket.key;
}