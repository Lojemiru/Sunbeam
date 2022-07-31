/// Updates the physical Window on the OS to the game parameters.
var upd_w = window_get_width(), upd_h = window_get_height();

if (upd_w != wnd_width || upd_h != wnd_height) {
	display_reset(0, true);
	display_set_gui_size(wnd_width, wnd_height);
}

if (wnd_resize == true) {
	if (upd_w != wnd_width || upd_h != wnd_height) {
		display_reset(0, true);
		
		var wx = floor(window_get_x() + (upd_w - wnd_width)),
			wy = floor(window_get_y() + (upd_h - wnd_height));
		window_set_position(wx, wy);
		window_set_size(wnd_width, wnd_height);
		display_set_gui_size(wnd_width, wnd_height);
	}
	
	wnd_resize = false;
}