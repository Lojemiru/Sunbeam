/// @description Create new scene camera.

// Enable View 0.
view = 0;
view_enabled = true;
view_set_visible(0,true);

for(var i = 1; i < 8; i++)
	view_set_visible(i, false);
	
/*
	This is the physical camera render (pre-view zoom).
	** Does not reflect the virtual view port (e.g. camera render when zoomed).
	** This is just the actual camera pre-zoom render.
*/
var wnd = global.Runtime;
camera_s = -1; // Surface.
camera_x = 0; // Y-Position.
camera_y = 0; // X-Position.
camera_w = wnd.cam_width; // Width.
camera_h = wnd.cam_height; // Height.
camera_z = 1; // Zoom level.
camera_t = 1; // Target zoom level.
camera_r = false; // Whether or not to activate/render camera.
camera_d = 3; // Render delta scaling (mainly for rotations).

// Create the camera backend.
camera_w = floor(wnd.cam_width);
camera_h = floor(wnd.cam_height);
camera = camera_create_view(camera_x, camera_y, camera_w, camera_h, 0, -1, 0, 0, 0, 0);
	
// Set the target view.
view_set_visible(view, true);
camera_set_view_size(camera, camera_w, camera_h);
view_set_wport(view, camera_w);
view_set_hport(view, camera_h);
view_set_camera(view, camera);

// Set the view as attached to this camera.
camera_r = true;

/*
	This is the virtual camera render (post-view zoom).
	** These variables are specifically for rendering to the camera for the game.
*/
render_x = 0;
render_y = 0;
render_w = 0;
render_h = 0;

/*
	The offset position of the physical camera position to the virtual camera position.
*/
offset_x = 0;
offset_y = 0;

/*
	This allows the camera to be positioned relative to the virtual position.
	** These variables are for adjusting the physical camera position
		relative to the virtual camera position.
		
		This is important because the camera operates in 2 positions:
			A. Physical Camera Position: where the camera is actual located.
			B. Virtual Camera Position: where the camera is showing after zooming (camera_xy + zoom_xy).
*/
target_o = -1; // Object that has camera control.
target_p = -1; // Priority of the object with camera control.
target_x = 0;
target_y = 0;
target_w = 0;
target_h = 0;