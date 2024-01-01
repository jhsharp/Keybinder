text[0] = "Programming/Design:\nJacob Sharp\n   \nArt:\nLuke Sharp";
text[1] = "Music:\n   \nMenu Theme:\n\"Awake!\" by cynicmusic\n   \nCredits Theme:\n\"Future Travel\" by Zodik"
text[2] = "Area 1 Theme:\n\"Tower Defense Theme\" by DST\n   \nArea 2 Theme:\n\"Cyberpunk Moonlight Sonata\" by Joth\n   \nArea 3 Theme:\n\"Raining Bits\" by Gundatsch"
text[3]	= "Game Produced With\nGameMaker Studio 2\n     \nSounds Effects Found At\nFreesounds.org";
text[4] = "This game was originally made for\nGMTK Game Jam 2020\n     \nThe theme of the jam was\n\"Out of Control\"";
text[5] = "Thank you for playing!\n          \nWe hope you enjoyed it!";

spd = 0.25;
letters = 0;
currentline = 0;
length = string_length(text[currentline]);
mytext = "";

finished = false;
wait_time = room_speed * 5;
wait = true;

RES_W = 1024;
RES_H = 768;