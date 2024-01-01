/// @desc Control Player

// Collect/Process Inputs
moveDirection = (global.rightPower && keyboard_check(global.keyRight)) - (global.leftPower && keyboard_check(global.keyLeft));
run = (global.runPower && keyboard_check(global.keyRun));
if (run) moveX = moveDirection * runSpeed;
else moveX = moveDirection * moveSpeed;

jump = (global.jumpPower && keyboard_check(global.keyJump) && place_meeting(x, y + 1, oSolid));
jetpack = (global.jetpackPower && keyboard_check(global.keyJetpack));


if (jump) moveY = -jumpSpeed;
else if (jetpack) moveY = -jetpackSpeed;
else moveY += fallSpeed;

pull = (global.pullPower && place_meeting(x, y + 1, oSolid) && keyboard_check(global.keyPull));
if (pull) {
	moveX = moveDirection * pullSpeed;
	if place_meeting(x + image_xscale, y, oBox) {
		pullTarget = instance_nearest(x + image_xscale, y, oBox);
	}
	else pullTarget = noone;
}
else pullTarget = noone;

shield = (global.shieldPower && keyboard_check(global.keyShield));

interact = (global.interactPower && keyboard_check(global.keyInteract) && (distance_to_object(oSwitch) <= interactRange) && interactPossible);

// Horizontal Collisions
if place_meeting(x + moveX, y, oSolid) {
	pullMove = 0;
	while !place_meeting(x + sign(moveX), y, oSolid) {
		x += sign(moveX);
		pullMove += sign(moveX);
	}
}
else {
	x += moveX;
	pullMove = moveX;
}

// Vertical Collisions
if place_meeting(x, y + moveY, oSolid) {
	while !place_meeting(x, y + sign(moveY), oSolid) {
		y += sign(moveY);
	}
	moveY = 0;
}
else y += moveY;



// Pushing Objects
if place_meeting(x + sign(moveX), y, oBox) {
	pushMove = PushBox(sign(moveX), pushSpeed, instance_nearest(x + (48 * sign(moveX)), y, oBox));
	if place_meeting(x + pushMove, y, oSolid) {
		while !place_meeting(x + sign(pushMove), y, oSolid) {
			x += sign(pushMove);
			if (pullTarget != instance_nearest(x + (48 * sign(moveX)), y, oBox)) pullMove += sign(pushMove);
		}
	}
	else {
		x += pushMove;
		if (pullTarget != instance_nearest(x + (48 * sign(moveX)), y, oBox)) pullMove += pushMove;
	}
}

// Pulling Objects
if (pullTarget != noone) with (pullTarget) {
	x += other.pullMove;
}

// Interact
if (interact) {
	if (distance_to_object(oSwitchRed) <= interactRange) global.redActive = !global.redActive;
	else if (distance_to_object(oSwitchBlue) <= interactRange) global.blueActive = !global.blueActive;
	else if (distance_to_object(oSwitchYellow) <= interactRange) global.yellowActive = !global.yellowActive;
	interactPossible = false;
	alarm[0] = interactCooldown;
}

// Damage
if (!shield) && place_meeting(x, y, oHazard) {
	if (!audio_is_playing(snDeath)) audio_play_sound(snDeath, 50, false);
	SlideTransition(TRANS_MODE.GOTO, room);
	instance_destroy();
}
if place_meeting(x, y, oFireball) {
	with (instance_nearest(x, y, oFireball)) instance_destroy();
}
if (place_meeting(x, y, oLaserRed) && global.redActive) || (place_meeting(x, y, oLaserBlue) && global.blueActive) || (place_meeting(x, y, oLaserYellow) && global.yellowActive) {
	if (!audio_is_playing(snDeath)) audio_play_sound(snDeath, 50, false);
	SlideTransition(TRANS_MODE.GOTO, room);
	instance_destroy();
}

// Animation Control
if ((moveDirection != 0) && (!pull)) image_xscale = moveDirection;

if (jump) {
	sprite_index = sPlayerAir;
	image_index = 0;
	image_speed = 1;
}
else if (jetpack) {
	sprite_index = sPlayerAir;
	image_speed = 1;
}
else if (sprite_index == sPlayerAir) {
	image_speed = 1;
	if (image_index > 1) sprite_index = sPlayerGround;
}
else {
	sprite_index = sPlayerGround;
	if (moveX != 0) image_speed = 1;
	if (run) image_speed = 2;
	else image_speed = 0;
}

// Audio
if (run) {
	if (audio_is_playing(snMove)) audio_stop_sound(snMove);
	if (!audio_is_playing(snRun)) audio_play_sound(snRun, 25, true);
}
else if moveX != 0 {
	if (audio_is_playing(snRun)) audio_stop_sound(snRun);
	if (!audio_is_playing(snMove)) audio_play_sound(snMove, 25, true);
}
else {
	if (audio_is_playing(snMove)) audio_stop_sound(snMove);
	if (audio_is_playing(snRun)) audio_stop_sound(snRun);
}

if (jetpack) {
	if (!audio_is_playing(snJetpack)) audio_play_sound(snJetpack, 25, true);
}
else if (jump) {
	if (!audio_is_playing(snJetpack)) audio_play_sound(snJetpack, 25, false);
}
else {
	if (audio_is_playing(snJetpack)) audio_stop_sound(snJetpack);
}

if (pushMove > 0) || (pullMove > 0) {
	if (!audio_is_playing(snDrag)) audio_play_sound(snDrag, 10, true);
}
else {
	if (audio_is_playing(snDrag)) audio_stop_sound(snDrag);
}

if (pull) {
	if (!audio_is_playing(snMagnet)) audio_play_sound(snMagnet, 25, true);
}
else {
	if (audio_is_playing(snMagnet)) audio_stop_sound(snMagnet);
}

if (shield) {
	if (!audio_is_playing(snShield)) audio_play_sound(snShield, 25, true);
}
else {
	if (audio_is_playing(snShield)) audio_stop_sound(snShield);
}

if (interact) audio_play_sound(snSwitch, 25, false);