/// @description Insert description here
// Create lights on mouse clicks.
var render_x = global.Runtime.camera.render_x;
var render_y = global.Runtime.camera.render_y;
var render_w = global.Runtime.camera.render_w;
var render_h = global.Runtime.camera.render_h;
var window_w = global.Runtime.wnd_width;
var window_h = global.Runtime.wnd_height;
var mx = render_x + ((mouse_x/window_w) * render_w);
var my = render_y + ((mouse_y/window_h) * render_h);

if (mouse_check_button_pressed(mb_left))
		with(instance_create_depth(0, 0, 0, Obj_LightSample)) {
			Scr_QRTLightXY(mx, my);
			Scr_QRTLightRadius(512);
			Scr_QRTLightRGBSrc(1,1,1);
			Scr_QRTLightRGBDst(0,0.5,1);
		}

if (mouse_check_button_pressed(mb_middle))
		with(instance_create_depth(0, 0, 0, Obj_LightSample)) {
			Scr_QRTLightXY(mx, my);
			Scr_QRTLightRadius(256);
			Scr_QRTLightRGBSrc(1,1,1);
			Scr_QRTLightRGBDst(1,0,0.5);
		}

if (mouse_check_button_pressed(mb_right))
		with(instance_create_depth(0, 0, 0, Obj_LightSample)) {
			Scr_QRTLightXY(mx, my);
			Scr_QRTLightRadius(128);
			Scr_QRTLightRGBSrc(1,1,1);
			Scr_QRTLightRGBDst(0.5,1,0);
		}