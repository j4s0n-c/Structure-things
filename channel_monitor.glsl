precision mediump float;
// template : glsl.ergonenous-tones.com
varying vec2 tcoord;    // location
uniform sampler2D tex;  // texture one
uniform sampler2D tex2; // texture two
uniform vec2 tres;      // size of texture (screen)
uniform vec4 fparams;   // 4 floats coming in
uniform ivec4 iparams;  // 4 ints coming in
uniform float ftime;    // 0.0 to 1.0
uniform int itime;      // increases when ftime hits 1.0
//f0:: select
//f1:: monochrome
//f2::
float f0 = mix(0.0, 1.0, fparams[0]);
float f1 = mix(0.05, 0.95, fparams[1]);
float f2 = mix(0.05, 0.95, fparams[2]);

float time = float(itime) + ftime;
vec2 resolution = tres;



void main( void ) {
	
	vec2 p = gl_FragCoord.xy/tres.xy;
		
	int channel = int( f0 / 0.2);
	

	if (channel >= 4) {
	   // 4 mini displays
	   vec2 miniP;
	   vec2 newSize = vec2(0.5, 0.5);
	   if (p.x < 0.5){
	        if (p.y < 0.5) {
				channel = 2;
				miniP = p;			
			}
			else {
				channel = 0;
				miniP = vec2(p.x, p.y - 0.5);
			}
			
	   }
	   else {
	        if (p.y < 0.5) {
			channel = 3;
			miniP = vec2(p.x - 0.5, p.y);
		}
		else {
			channel = 1;
			miniP = vec2(p.x -0.5, p.y - 0.5);
		}			
	   }
	   p = miniP * 2.0;
	}
	
   // Full image, eithe red, green, blue, or all rgb
   vec4 col = texture2D(tex, p);
   gl_FragColor = vec4(0.0, 0.0, 0.0, 1.0);
   if (channel == 0)
	gl_FragColor.r = col.r;
   else if (channel == 1)
	gl_FragColor.g = col.g;
   else if (channel == 2)
	gl_FragColor.b = col.b;
   else
	gl_FragColor = col;

   if (f1 >= 0.5) {
	// Luma
	// Photometric/digital
	// Y = 0.2126 R + 0.7152 G + 0.0722 B
	// Digital ITU BT.601 (gives more weight to the R and B components):
	// Y = 0.299 R + 0.587 G + 0.114 B
	float luma = 0.2126 * gl_FragColor.r + 0.7152 * gl_FragColor.g + 0.0722 * gl_FragColor.b;
	gl_FragColor = vec4(luma, luma, luma, 1.0);
   }
}