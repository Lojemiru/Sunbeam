function Scr_MyCollisionRenderer() {
	var list = ds_exists(argument[0], ds_type_list)? argument[0] : -1;
	var camera = global.Runtime.camera;
	var camera_x = camera.camera_x;
	var camera_y = camera.camera_y;

	// CLear the collision surface for this frame.
	draw_clear_alpha(c_black, 0);
	draw_sprite(Spr_Collision, 0, -camera_x, -camera_y);
	with(Obj_Sample){draw_sprite_ext(sprite_index, 0, x-camera_x,y-camera_y,image_xscale, image_yscale, image_angle, c_white, 1);}


}
