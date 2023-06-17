shader_type canvas_item;

uniform float pixelSize : hint_range(2, 16, 2) = 4;
uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
	
	vec2 iRes = 1.0 / SCREEN_PIXEL_SIZE;
	
	float onePixelSizeX = 1.0 /  iRes.x;
	float onePixelSizeY = 1.0 / iRes.y;
	
	float cellSizeX = float(pixelSize)  * onePixelSizeX;
	float cellSizeY = float(pixelSize)  * onePixelSizeY;
	
	float x  = cellSizeX * floor(UV.x / cellSizeX);
	float y  = cellSizeY * floor(UV.y / cellSizeY);
	
	COLOR = texture(screen_texture, vec2(x,y));
}
