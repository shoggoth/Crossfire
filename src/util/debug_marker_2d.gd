class_name DebugMarker2D extends Marker2D

@export var origin = Vector2.ZERO
@export var line_width = -1.0
@export var darken = 0.5
@export var centre_colour = Color.WHITE

var _x_colour = Color.RED
var _y_colour = Color.GREEN

func _draw() -> void:
	var x_off = Vector2(gizmo_extents, 0)
	var y_off = Vector2(0, gizmo_extents)
	
	# Draw axes
	draw_line(origin, origin + x_off, _x_colour, line_width)
	draw_line(origin, origin + y_off, _y_colour, line_width)
	draw_line(origin, origin - x_off, _x_colour.darkened(darken), line_width)
	draw_line(origin, origin - y_off, _y_colour.darkened(darken), line_width)
	
	# Draw centre
	var lw = 1.0 if line_width < 0 else line_width
	var lwv = Vector2(lw, 0) * 0.5
	draw_line(origin - lwv, origin + lwv, centre_colour, lw)
