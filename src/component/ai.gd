class_name AIComponent extends Node


@export_group("Capabilities")
@export var intelligence := 4

@export_group("Control")
@export var state_machine: StateMachine

var _thinking_time = 0.0


func _process(delta):
	_thinking_time += delta
	if _thinking_time > intelligence:
		match state_machine.current_state.name:
			"Hide": state_machine.enter_state_named("Lurk")
		_thinking_time -= intelligence


func _on_state_machine_state_changed(_from, _to):
	pass


func _on_move_component_finished_moving(_mc):
	match state_machine.current_state.name:
		"Lurk": state_machine.enter_state_named("Track")
		#"Move": state_machine.enter_state_named("Wander")
		#"Wander": state_machine.enter_state_named("Track")
		#"Track": state_machine.enter_state_named("Wander")
