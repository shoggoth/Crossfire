class_name Player extends CharacterBody2D


signal destroyed(player: Player)

@onready var input = $InputComponent


func _on_health_component_health_changed(health):
	if health <= 0: destroyed.emit(self)
	
	# TODO: Remove this CREATES CYCLIC EXPLODE CONDITION!
	$StateMachine.enter_state_named("Explode")
