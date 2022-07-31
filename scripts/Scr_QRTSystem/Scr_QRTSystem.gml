/// @description Creates the QRT system
/// @param ShaderA ray-tracer
/// @param ShaderB light-sampler
/// @param LightList ds_list of light obj
/// @param GameView Width
/// @param GameView Height
function Scr_QRTSystem() {

	global.QRTCS_Surface = -1;
	global.QRTCS_SizeW = argument[3];
	global.QRTCS_SizeH = argument[4];
	global.QRTLight_Surface = -1;

	global.QRTRT_Shader = argument[0];
	global.QRTRT_WorldMap = shader_get_sampler_index(global.QRTRT_Shader, "in_WorldMap");
	global.QRTRT_Light = shader_get_uniform(global.QRTRT_Shader, "in_Light");
	global.QRTRT_World = shader_get_uniform(global.QRTRT_Shader, "in_World");
	global.QRTRT_RayTexSize = shader_get_uniform(global.QRTRT_Shader, "in_RayTexSize");

	global.QRTLS_Shader = argument[1];
	global.QRTLS_WorldMap = shader_get_sampler_index(global.QRTLS_Shader, "in_WorldMap");
	global.QRTLS_RayMap = shader_get_sampler_index(global.QRTLS_Shader, "in_RayMap");
	global.QRTLS_Light = shader_get_uniform(global.QRTLS_Shader, "in_Light");
	global.QRTLS_ColorS = shader_get_uniform(global.QRTLS_Shader, "in_ColorS");
	global.QRTLS_ColorD = shader_get_uniform(global.QRTLS_Shader, "in_ColorD");
	global.QRTLS_WorldTexSize = shader_get_uniform(global.QRTLS_Shader, "in_WorldTexSize");
	global.QRTLS_RayTexSize = shader_get_uniform(global.QRTLS_Shader, "in_RayTexSize");
	global.QRTLS_LightTexSize = shader_get_uniform(global.QRTLS_Shader, "in_LightTexSize");
	global.QRTLS_LightCenter = shader_get_uniform(global.QRTLS_Shader, "in_LightCenter");

	global.QRTLight_List = ds_list_create();
	var __QRTLightList = argument[2];
	if (ds_exists(__QRTLightList, ds_type_list))
		for(var i = 0; i < ds_list_size(__QRTLightList); i++)
			if (object_exists(__QRTLightList[| i])) {
				ds_list_add(global.QRTLight_List, __QRTLightList[|i]);
			} else { show_error("Scr_QRTSystem(): Object provided as light does not exist!", false); }

	global.QRTLight_RaySizes = [8, 16, 32, 64, 128, 256];
	global.QRTLight_LightSizes = [8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096];
	global.QRTLight_RayRef = [-1,-1,-1,-1,-1,-1];
	global.QRTLight_LightRef = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];

	var sprsurf = surface_create(global.QRTLight_LightSizes[9], global.QRTLight_LightSizes[9]);
	for(var i = 0; i < 6; i++)
		global.QRTLight_RayRef[i] = sprite_create_from_surface(sprsurf, 0, 0, global.QRTLight_RaySizes[i], global.QRTLight_RaySizes[i], true, false, 0, 0);
	for(var i = 0; i < 10; i++)
		global.QRTLight_LightRef[i] = sprite_create_from_surface(sprsurf, 0, 0, global.QRTLight_LightSizes[i]*2, global.QRTLight_LightSizes[i]*2, true, false, 0, 0);

	return 1;


}
