class_name AIComponent extends Node


@export_group("Capabilities")
@export var intelligence := 4

@export_group("Control")
@export var state_machine: StateMachine

var _thinking_time = 0.0
var player: Player


func _process(delta):
	_thinking_time += delta
	if _thinking_time > intelligence:
		if is_instance_valid(player): print("Player = ", Global.grid_position(player))
		match state_machine.current_state.name:
			"Hide": state_machine.enter_state_named("Lurk")
		_thinking_time -= intelligence


func _on_state_machine_state_changed(_from, _to):
	pass


func _on_move_component_finished_moving(_mc):
	print("Self = ", Global.grid_position(state_machine.get_meta("parent_node")))
	match state_machine.current_state.name:
		"Lurk": state_machine.enter_state_named("Track", { "destination" : Vector2(3, 3) })
		"Track": state_machine.enter_state_named("Track", { "destination" : Vector2(randi_range(1, 6), randi_range(1, 5)) })
		#"Move": state_machine.enter_state_named("Wander")
		#"Wander": state_machine.enter_state_named("Track")
		#"Track": state_machine.enter_state_named("Wander")
