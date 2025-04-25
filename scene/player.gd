class_name Player extends CharacterBody2D

signal spawned(player: Player)
signal destroyed(player: Player)

@onready var input = $InputComponent

var _respawn_pos: Vector2

func _ready():
	_respawn_pos = position
	spawned.emit(self)

func _on_health_component_health_changed(health):
	if health <= 0:
		$StateMachine.enter_state_named("Explode", { "completion" : func(_name): destroyed.emit(self) })

func reset():
	#TODO: state machine reset instead of being specific
	$StateMachine.enter_state_named("Idle")
	position = _respawn_pos
	spawned.emit(self)
