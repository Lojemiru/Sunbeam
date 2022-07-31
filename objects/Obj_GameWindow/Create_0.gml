/// @description Insert description here
// You can write your code in this editor
/*
	ASPECT
	SCALE
	WND_WIDTH
	WND_HEIGHT
	CAM_WIDTH
	CAM_HEIGHT
*/
global.Runtime = id;

// Set aspect ratio, disable AA and enable v-sync.
aspect = display_get_height() / display_get_width();
// Sets the scale of the game screen to the display.
scale = 0.75;

// Set the window size and the camera size.
wnd_resize = true;
wnd_width = floor(display_get_width() * scale);
wnd_height = floor(wnd_width * aspect);
cam_width = 960;
cam_height = 540;

// Defaults, don't touch.
zoom_x = 0;
zoom_y = 0;
zoom_w = 0;
zoom_h = 0;
scale_x = 0;
scale_y = 0;

// Sets the game's default FPS.
display_reset(0, true);
game_set_speed(144, gamespeed_fps);
camera = instance_create_depth(0, 0, 9999, Obj_GameCamera);