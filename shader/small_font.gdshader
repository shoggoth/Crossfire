shader_type canvas_item;

uniform vec2 offset;
varying flat float pos;

void vertex() {
	pos = VERTEX.x / -3.0;
	VERTEX += offset;
}

uniform int time;

void fragment() {
	vec4 colours[3] = {
		vec4(0.7, 0.1, 0.1, 1.0),
		vec4(0.1, 0.6, 0.1, 1.0),
		vec4(0.1, 0.1, 1.0, 1.0)
	};
	vec4 c = texture(TEXTURE, UV);
	float p = mod(pos, 1.0);
	COLOR = c * ((colours[time % 3] * (step(0, p) - step(0.25, p)))
	+ (colours[(time + 1) % 3] * (step(0.25, p) - step(0.5, p)))
	+ (colours[(time + 2) % 3] * (step(0.5, p) - step(0.75, p))));
}