class_name AIComponent extends Node


@export_group("Capabilities")
@export var intelligence := 0.5

@export_group("Control")
@export var state_machine: StateMachine

var _thinking = false


func _process(_delta):
	if _thinking: return
	_thinking = true
	await get_tree().create_timer(intelligence).timeout
	match state_machine.current_state.name:
		"Hide": state_machine.enter_state_named("Lurk")
		"Lurk": state_machine.enter_state_named("Hide")
	_thinking = false


func _on_state_machine_state_changed(_from, _to):
	pass
