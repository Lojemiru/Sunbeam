/// @description Renders the QRT light system.
/// @param RenderScript the script to draw to the collision surface.
/// @param ArrayArgs arguments populated to an array or ds_list for your render script.
/// @param CameraX xposition
/// @param CameraY yposition
function Scr_QRTRender() {
	var camerax = argument[2];
	var cameray = argument[3];

	if (!surface_exists(global.QRTLight_Surface))
		global.QRTLight_Surface = surface_create(global.QRTCS_SizeW, global.QRTCS_SizeH);
	if (!surface_exists(global.QRTCS_Surface))
		global.QRTCS_Surface = surface_create(global.QRTCS_SizeW, global.QRTCS_SizeH);

	surface_set_target(global.QRTCS_Surface);
	script_execute(argument[0], argument[1]);
	surface_reset_target();

	// Raytrace every light's rays to the light's information ray texture.
	for(var i = 0; i < ds_list_size(global.QRTLight_List); i++)
		with(global.QRTLight_List[|i]) {
			// If the light currently does not have a surface for ray tracing, create it, set the surface as the target.
			if (!surface_exists(__QRTLights)) __QRTLights = surface_create(global.QRTLight_RaySizes[__QRTLightrr],global.QRTLight_RaySizes[__QRTLightrr]);
			surface_set_target(__QRTLights);
				shader_set(global.QRTRT_Shader);
				// Pass the collision map and light's information to the raytrace shader.
				texture_set_stage(global.QRTRT_WorldMap, surface_get_texture(global.QRTCS_Surface));
				shader_set_uniform_f_array(global.QRTRT_Light, [__QRTLightx-camerax, __QRTLighty-cameray, __QRTLightz]);
				shader_set_uniform_f_array(global.QRTRT_World, [1/global.QRTCS_SizeW,1/global.QRTCS_SizeH]);
				shader_set_uniform_f(global.QRTRT_RayTexSize, global.QRTLight_RaySizes[__QRTLightrr]);
				// Pass the light's ray texture to the raytrace shader.
				draw_sprite(global.QRTLight_RayRef[__QRTLightrr],0,0,0);
				shader_reset();
			surface_reset_target();
		}

	// Draw all of the lights together onto the surface then blend them.
	surface_set_target(global.QRTLight_Surface);
	draw_clear_alpha(c_black, 1);
	gpu_set_blendmode(bm_add);

		// For each light render the light using the LightSampler shader.
		for(var i = 0; i < ds_list_size(global.QRTLight_List); i++)
			with(global.QRTLight_List[|i]) {
				shader_set(global.QRTLS_Shader);
				texture_set_stage(global.QRTLS_WorldMap,surface_get_texture(global.QRTCS_Surface));
				texture_set_stage(global.QRTLS_RayMap,surface_get_texture(__QRTLights));
				shader_set_uniform_f_array(global.QRTLS_Light, [__QRTLightx-camerax, __QRTLighty-cameray, __QRTLightz]);
				shader_set_uniform_f_array(global.QRTLS_ColorS, [__QRTLightrS, __QRTLightgS, __QRTLightbS]);
				shader_set_uniform_f_array(global.QRTLS_ColorD, [__QRTLightrD, __QRTLightgD, __QRTLightbD]);
				shader_set_uniform_f_array(global.QRTLS_WorldTexSize, [1/global.QRTCS_SizeW,1/global.QRTCS_SizeH]);
				shader_set_uniform_f(global.QRTLS_RayTexSize, global.QRTLight_RaySizes[__QRTLightrr]);
				shader_set_uniform_f(global.QRTLS_LightTexSize, global.QRTLight_LightSizes[__QRTLightlr]*2);
				var center = global.QRTLight_LightSizes[__QRTLightlr];
				shader_set_uniform_f_array(global.QRTLS_LightCenter, [center,center]);
				draw_sprite(global.QRTLight_LightRef[__QRTLightlr], 0, __QRTLightx - camerax - center, __QRTLighty - cameray - center);
				shader_reset();
			}

	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	// Draw the game's collision surface (not necessary).
	draw_surface(global.QRTCS_Surface, camerax, cameray);

	// Draw the light surface and blend to bring out the alpha component.
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	draw_surface(global.QRTLight_Surface, camerax, cameray);
	gpu_set_blendmode(bm_normal);


}
