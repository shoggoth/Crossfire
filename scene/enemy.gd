class_name Enemy extends CharacterBody2D



func _on_health_component_health_changed(health):
	$StateMachine.enter_state_named("Explode")
