shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform float text_length;
uniform float time;

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV) * abs(sin(time));
	//COLOR = vec4(1.0);
}
