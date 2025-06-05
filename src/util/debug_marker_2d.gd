class_name DebugMarker2D extends Marker2D

@export var line_width = -1.0
@export var darken = 0.5
@export var centre_colour = Color.WHITE

var _x_colour = Color.RED
var _y_colour = Color.BLUE

func _draw() -> void:
	var x_off = Vector2(gizmo_extents, 0)
	var y_off = Vector2(0, gizmo_extents)
	
	# Draw axes
	draw_line(position, position + x_off, _x_colour, line_width)
	draw_line(position, position + y_off, _y_colour, line_width)
	draw_line(position, position - x_off, _x_colour.darkened(darken), line_width)
	draw_line(position, position - y_off, _y_colour.darkened(darken), line_width)
	
	# Draw centre
	var lw = Vector2(line_width, line_width)
	draw_rect(Rect2(position - lw * 0.5, lw), centre_colour)
