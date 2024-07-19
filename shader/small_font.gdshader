shader_type canvas_item;

varying flat float pos;
uniform vec2 offset;

void vertex() {
	pos = VERTEX.x / (offset.x * -2.0);
	VERTEX += offset;
}

uniform float time;

void fragment() {
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV) * abs(sin(time));
	//COLOR = red;
	COLOR *= vec4(vec3(pos), 1.0) * red;
}
