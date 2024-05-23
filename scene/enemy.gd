class_name Enemy extends CharacterBody2D


@export var type = 0

var spawn_pos: Vector2
var destroyed: Callable


func _ready():
	$Sprite2D.frame = type


func _on_health_component_health_changed(health):
	if health <= 0:
		$StateMachine.enter_state_named("Explode", { "completion" : destroyed })
