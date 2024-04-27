class_name GridMoveComponent extends Node


@export_group("Movement")
@export var speed: float = 16.0
@export var grid_size := Vector2(16, 16)

var _direction := Vector2.ZERO
var _target := Vector2.ZERO


func move(position, direction) -> Vector2:
	var target_direction = (_target - position).normalized()
	if direction && (!_direction || direction.angle() != _direction.angle()):
		_target = (position + grid_size * direction).snapped(grid_size)
	return speed * target_direction
