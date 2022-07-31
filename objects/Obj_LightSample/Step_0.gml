/// @description Insert description here
// You can write your code in this editor
if (!init) {
	xx = Scr_QRTLightGetX();
	yy = Scr_QRTLightGetY();
	rr = Scr_QRTLightGetRad();
	init = true;
}

aa ++;
Scr_QRTLightXY(floor(xx + lengthdir_y(8,aa)),floor(yy + lengthdir_x(8,aa)));
Scr_QRTLightRadius(rr + (dsin(aa) * 32));