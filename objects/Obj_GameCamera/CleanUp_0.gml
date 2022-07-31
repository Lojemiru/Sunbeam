/// @description Cleanup Camera Controls
if (surface_exists(camera_s))
	surface_free(camera_s);

if (camera != -1)
	camera_destroy(camera);