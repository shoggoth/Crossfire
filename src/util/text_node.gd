class_name TextNode extends Node2D


const DEFAULT_SIZE = 5

var text: String
var _default_font: Font = Global.small_font

func _draw(font = _default_font, size = DEFAULT_SIZE):
	draw_string(font, Vector2(0, 0), text, HORIZONTAL_ALIGNMENT_CENTER, -1, size)
