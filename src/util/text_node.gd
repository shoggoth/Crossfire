class_name TextNode extends Node2D


var text: String
var _default_font: Font = ThemeDB.fallback_font

func _draw():
	draw_string(_default_font, Vector2(0, 0), text, HORIZONTAL_ALIGNMENT_CENTER)
