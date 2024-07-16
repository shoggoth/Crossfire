@tool class_name TextNode extends Node2D


const DEFAULT_SIZE = 5
const DEFAULT_FONT: Font = preload("res://gfx/SmallFont.png")
const DEFAULT_SHADER = preload("res://shader/small_font.gdshader")

@export var text: String:
	set(value):
		text = value

var _time: float


func _ready():
	var mat = ShaderMaterial.new()
	mat.shader = DEFAULT_SHADER
	mat.set_shader_parameter("text_length", text.length())
	material = mat


func _process(delta):
	_time += delta
	material.set_shader_parameter("time", _time * 0.5 * PI)


func _draw(font = DEFAULT_FONT, size = DEFAULT_SIZE):
	draw_string(font, Vector2(text.length() * -size * 0.5, 0), text, HORIZONTAL_ALIGNMENT_CENTER, -1, size)
