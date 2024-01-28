# Structure-things
Shaders for the Erogenous Tones Structure video synthesizer module.

### channel_monitor.glsl
  Color channel monitor with each channel (R,G,B) in fullscreen and a quad split mode with each channel and the mix.
  ![PXL_20240128_061644959](https://github.com/j4s0n-c/Structure-things/assets/4063528/1e3f9e03-42d4-4a66-80d5-63b9e829210f)

  Parameter 1: Select channel/mix to output. 4 values: 
  
    1. Fullscreen red channel
    2. Fullscreen green channel
    3. Fullscreen blue channel
    4. Quad-split screen of R, G, B channels + a mix of all channels
  Parameter 2: Color / Monochrome output
