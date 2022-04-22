shader_type canvas_item;

void fragment() {
	COLOR = texture(TEXTURE, UV + vec2(sin(TIME + UV.y * 20.0) * 0.03, 0));
}
