class_name Player extends CharacterBody2D


signal destroyed(player: Player)

@onready var input = $InputComponent


func _on_health_component_health_changed(health):
	if health <= 0:
		$StateMachine.enter_state_named("Explode", { "completion" : func(_name): destroyed.emit(self) })
