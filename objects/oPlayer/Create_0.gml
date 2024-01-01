/// @desc Set Variables

global.leftPower = false;
global.rightPower = false;
global.jumpPower = false;
global.pullPower = false;
global.jetpackPower = false;
global.runPower = false;
global.shieldPower = false;
global.interactPower = false;

global.keyLeft = ord("A");
global.keyRight = ord("D");
global.keyJump = ord("W");
global.keyPull = ord("J");
global.keyJetpack = ord("I");
global.keyRun = ord("L");
global.keyShield = ord("S");
global.keyInteract = ord("K");

moveX = 0;
moveSpeed = 4;
moveDirection = 0;

run = false;
runSpeed = moveSpeed * 2;

moveY = 0;
jump = false;
jumpSpeed = 8;
fallSpeed = .4;

pushMove = 0;
pushSpeed = moveSpeed / 2;

pull = false;
pullTarget = noone;
pullMove = 0;
pullSpeed = pushSpeed;

jetpack = false;
jetpackSpeed = 3;

interactRange = 5;
interactCooldown = 10;
interactPossible = true;

image_xscale = 1;