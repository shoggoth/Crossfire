class_name VelocityComponent extends Node


@export_group("Movement")
@export var speed: float = 90.0
@export var accel: float = 900.0

var velocity := Vector2.ZERO


func move(body: CharacterBody2D, direction, delta):
	velocity = velocity.move_toward(speed * direction, accel * delta)
	body.velocity = velocity
	#body.velocity = speed * direction
	body.move_and_slide()
