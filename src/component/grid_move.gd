class_name MoveComponent extends Node


signal finished_moving(move_component: MoveComponent)

@export_group("Movement")
@export var speed: float = 0.7
@export var grid_size := Vector2(32, 32)
@export_group("Control")
@export var quantise_direction: bool = false
@export_group("Grid Limits")
@export var minimum := Vector2(0, 0)
@export var maximum := Vector2(7, 6)

var moving: bool:
	get: return _move_tween != null

var _move_tween: Tween = null


func move(node: Node2D, direction: Vector2):
	if direction && !_move_tween:
		if quantise_direction: direction = Global.quantise(direction)
		var m = node.position + direction * grid_size
		if !is_in_grid_limits(m): return
		_move_tween = create_tween()
		_move_tween.tween_property(node, "position", m, speed)
		_move_tween.tween_callback(stop)


func stop():
	if _move_tween:
		_move_tween.kill()
		_move_tween = null
		finished_moving.emit(self)


func is_in_grid_limits(pos: Vector2) -> bool:
	return Rect2(minimum * grid_size, maximum * grid_size).has_point(pos)
