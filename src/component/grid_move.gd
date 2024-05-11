class_name MoveComponent extends Node


@export_group("Movement")
@export var speed: float = 0.7
@export var grid_size := Vector2(32, 32)
@export_group("Control")
@export var quantise_direction: bool = false

var move_tween: Tween = null


func move(node: Node2D, direction: Vector2):
	if direction && !move_tween:
		move_tween = create_tween()
		move_tween.tween_property(node, "position", node.position + _quantise(direction) * grid_size, speed)
		move_tween.tween_callback(stop)


func stop():
	if move_tween:
		move_tween.kill()
		move_tween = null


func _quantise(vec: Vector2) -> Vector2:
	if !quantise_direction: return vec
	if vec.x && vec.y: vec.x = 0
	return vec.normalized()
