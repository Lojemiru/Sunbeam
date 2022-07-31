/// @description Draw game camera
if (camera.camera_r) 
	draw_surface_part_ext(camera.camera_s, zoom_x, zoom_y, zoom_w, zoom_h, 0, 0, scale_x, scale_y, c_white, 1);

if (surface_exists(camera.camera_s)) {
	surface_set_target(camera.camera_s);
	draw_clear_alpha(c_black, 1);
	surface_reset_target();
}