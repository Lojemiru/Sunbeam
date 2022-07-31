function Scr_QRTGameViewSize() {
	global.QRTCS_SizeW = argument[3];
	global.QRTCS_SizeH = argument[4];

	if (surface_exists(global.QRTCS_Surface))
		surface_free(global.QRTCS_Surface);
	
	global.QRTCS_Surface = surface_create(global.QRTCS_SizeW, global.QRTCS_SizeH);
	return 1;


}
