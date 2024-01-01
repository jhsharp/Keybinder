/// @desc Shoot Fireball

audio_play_sound(snFireball, 15, false);
fireball = instance_create_layer(x, y, "Hazards", oFireball);
fireball.direction = direction;
fireball.image_angle = direction;
fireball.speed = fireballSpeed;
alarm[0] = fireRate;