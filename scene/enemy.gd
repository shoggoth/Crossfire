class_name Enemy extends CharacterBody2D


@export var type = 0

var spawn_pos: Vector2
var destroyed: Callable


func _ready():
	$Sprite2D.frame = type
	$StateMachine.set_meta("move_component", $MoveComponent)
	var hp = 0.5 * (Vector2.RIGHT if spawn_pos.y == 0 else Vector2.DOWN)
	$StateMachine/Lurk.home_pos = hp
	$StateMachine/Hide.home_pos = -hp


func _on_health_component_health_changed(health):
	if health <= 0:
		$StateMachine.enter_state_named("Explode", { "completion" : destroyed })
