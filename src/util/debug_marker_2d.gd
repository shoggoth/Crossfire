class_name DebugMarker2D extends Marker2D

@export var line_width = -1.0
@export var darken = 0.5

func _draw() -> void:
	draw_line(position, position + Vector2(gizmo_extents, 0), Color.RED, line_width)
	draw_line(position, position + Vector2(0, gizmo_extents), Color.BLUE, line_width)
	draw_line(position, position - Vector2(gizmo_extents, 0), Color.RED.darkened(darken), line_width)
	draw_line(position, position - Vector2(0, gizmo_extents), Color.BLUE.darkened(darken), line_width)
