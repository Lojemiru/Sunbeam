/// @description gets an RGB of the source or destination color
/// @param isSrcDst? true (src), false (dst)
/// @param rgb 0 (R), 1 (G) or 2 (B)
function Scr_QRTLightGetRGB() {

	var isSRC = argument[0], comp = argument[1];

	if (isSRC) {
		switch(comp) {
			case 0:
				return __QRTLightrS;
			case 1:
				return __QRTLightgS;
			case 2:
				return __QRTLightbS;
		}
	} else {
		switch(comp) {
			case 0:
				return __QRTLightrD;
			case 1:
				return __QRTLightgD;
			case 2:
				return __QRTLightbD;
		}
	}

	return -1;


}
