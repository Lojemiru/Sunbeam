/*
	Virtual Camera Draw while handling up/down pixel-sample delta scaling.
	This is done by drawing the camera surface which is upscaled by delta camera_d
	for enhanced pixel rotations.
		zoom_w : zoomed camera width
		zoom_h : zoomed camera height
		zoom_x : x-offset on camera surface when zoomed
		zoom_y : y-offset on camera surface when zoomed
		scale_x : upscales the surface section to fit to the window
	
	This takes the camera surface (W,H) * D
	Only draws the zoomed surface (ZW,ZH) * D
		with an offset on the surface for centering.
	
	|XY-----------------------------|
	|             CAMERA            |
	|    |XY-------------------|    |
	|    |         ZOOM        |    |
	|    |                     |    |
	|    |----------------XY+WH|    |
	|                               |
	|--------------------------XY+WH|
*/
zoom_w = camera.camera_w * camera.camera_d * camera.camera_z;
zoom_h = camera.camera_h * camera.camera_d * camera.camera_z;
zoom_x = ((camera.camera_w * camera.camera_d) - zoom_w) * 0.5;
zoom_y = ((camera.camera_h * camera.camera_d) - zoom_h) * 0.5;
scale_x = wnd_width / zoom_w;
scale_y = wnd_height / zoom_h;