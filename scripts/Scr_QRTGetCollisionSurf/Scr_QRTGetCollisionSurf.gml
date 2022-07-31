function Scr_QRTGetCollisionSurf() {
	if (!surface_exists(global.QRTCS_Surface)) surface_create(global.QRTCS_SizeW, global.QRTCS_SizeH);
	return global.QRTCS_Surface;


}
