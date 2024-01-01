/// @desc Destroy Upon Impact

if ((place_meeting(x, y, oSolid) || place_meeting(x, y, oLaser)) && !place_meeting(x, y, oLauncher)) instance_destroy();