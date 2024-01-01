/// @desc Activate Controls

if place_meeting(x, y + 25, oPowerSocket) 
{
	global.jumpPower = true;
	socket = instance_nearest(x, y + 25, oPowerSocket);
	global.keyJump = socket.key;
}