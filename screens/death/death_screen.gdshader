shader_type canvas_item;

void fragment() {
	COLOR = vec4(
		abs(sin(TIME + SCREEN_UV.x * 8.0) + tan(SCREEN_UV.y * 4.0)) * 0.4,
		0, 0, 1
	);
}
