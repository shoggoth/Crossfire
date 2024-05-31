class_name MoveComponent extends Node


@export_group("Movement")
@export var speed: float = 0.7
@export var grid_size := Vector2(32, 32)
@export_group("Control")
@export var quantise_direction: bool = false
@export_group("Grid Limits")
@export var minimum := Vector2(0, 0)
@export var maximum := Vector2(7, 6)

var move_tween: Tween = null


func move(node: Node2D, direction: Vector2):
	if direction && !move_tween:
		if quantise_direction: direction = Global.quantise(direction)
		var m = node.position + direction * grid_size
		if !is_in_grid_limits(m): return
		move_tween = create_tween()
		move_tween.tween_property(node, "position", m, speed)
		move_tween.tween_callback(stop)


func is_moving() -> bool: return move_tween != null


func stop():
	if move_tween:
		move_tween.kill()
		move_tween = null


func is_in_grid_limits(pos: Vector2) -> bool:
	return Rect2(minimum * grid_size, maximum * grid_size).has_point(pos)
