function Scr_QRTCleanUp() {
	if surface_exists(global.QRTLight_Surface) surface_free(global.QRTLight_Surface);
	if surface_exists(global.QRTCS_Surface) surface_free(global.QRTCS_Surface);
	if (ds_exists(global.QRTLight_List, ds_type_list)) ds_list_destroy(global.QRTLight_List);
	return 0;


}
