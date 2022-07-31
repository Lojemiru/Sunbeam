/// @description Handle camera delta
///
/// Don't handle the camera if no view is attached.
///
var wsize, hsize;
wsize = floor(global.Runtime.cam_width);
hsize = floor(global.Runtime.cam_height);

///
/// RENDER GAME VIEW TO SURFACE FOR REDRAWING.
///
if ((wsize != camera_w) || (hsize != camera_h) || !surface_exists(camera_s)
	|| (surface_get_width(camera_s) != (wsize * camera_d))
	|| (surface_get_height(camera_s) != (hsize * camera_d))) {
	camera_w = wsize;
	camera_h = hsize;
	
	if (surface_exists(camera_s))
		surface_free(camera_s);
	
	camera_s = surface_create(floor(wsize * camera_d), floor(hsize * camera_d));
	view_set_surface_id(view, camera_s);
	camera_set_view_size(camera, camera_w, camera_h);
	view_set_wport(view, camera_w);
	view_set_hport(view, camera_h);
}

///
/// THIS SETS THE PHYSICAL & VIRTUAL CAMERA POSITION.
///
render_w = camera_w * camera_z;
render_h = camera_h * camera_z;
target_w = render_w;
target_h = render_h;
offset_x = ((camera_w - render_w) * 0.5);
offset_y = ((camera_h - render_h) * 0.5);
render_x = camera_x + offset_x;
render_y = camera_y + offset_y;

///
/// THIS ZOOM ADJUSTS THE IN-GAME ZOOM LEVEL FOR THE PLAYER.
///
camera_x += keyboard_check(vk_right) - keyboard_check(vk_left);
camera_y += keyboard_check(vk_down) - keyboard_check(vk_up);
camera_t += (mouse_wheel_down() - mouse_wheel_up()) * 0.1;
camera_t = median(0.25, camera_t, 1);
camera_z = lerp(camera_z, camera_t, 0.05);
camera_set_view_pos(camera, camera_x, camera_y);