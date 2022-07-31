/// @descripion sets the light radius.
/// @param rad light radius
function Scr_QRTLightRadius(argument0) {
	__QRTLightz = argument0;
	__QRTLightrr = ceil(log2(sqrt(2 * pi * __QRTLightz))) - 3;
	__QRTLightlr = power(2, log2(ceil(log2(__QRTLightz)))) - 3;


}
