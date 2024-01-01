/// @desc Gravity and Animation

// Gravity
if !place_meeting(x, y + 1, oSolid) moveY += fallSpeed;

// Vertical Collisions
if place_meeting(x, y + moveY, oSolid) {
	while !place_meeting(x, y + sign(moveY), oSolid) {
		y += sign(moveY);
	}
	moveY = 0;
}
else y += moveY;
	
// Animation
if place_meeting(x, y + 25, oPowerSocket) {
	image_index = 1;
	with (instance_nearest(x, y + 25, oPowerSocket)) sprite_index = sPowerSocketOn;
}
else image_index = 0;