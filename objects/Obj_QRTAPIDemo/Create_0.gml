var list = ds_list_create();
ds_list_add(list, Obj_LightSample);
Scr_QRTSystem(Shd_RayTracer, Shd_LightSampler, list, 960, 540, 0);