class_name StateMachine extends Node


@export var current_state: State = null


func _ready():
	connect("child_entered_tree", _on_child_entered_tree)
	for child in get_children():
		if child is State:
			if child == current_state:
				child.enter_from.call_deferred(null)
			else:
				child.process_mode = Node.PROCESS_MODE_DISABLED
			child.set_meta("mob", get_parent())
			child.sm = self


func _on_child_entered_tree(child: Node):
	if child is State:
		child.process_mode = Node.PROCESS_MODE_DISABLED
		child.sm = self


func get_state(named: String) -> State:
	return get_node(named) as State


func enter_state(state: State, params := {}) -> bool:
	if !can_enter_state(state as State): return false
	if current_state:
		print_debug(current_state.name, " -> ", state.name)
		current_state.process_mode = Node.PROCESS_MODE_DISABLED
		current_state.exit_to(state)
	if state && state.enter_from(current_state, params):
		state.process_mode = Node.PROCESS_MODE_INHERIT
		current_state = state
		return true
	return false


func enter_state_named(state_name: String, params := {}) -> bool:
	var state = get_state(state_name)
	return false if !state else enter_state(state, params)


func can_enter_state(state: State) -> bool:
	return !current_state || current_state.valid_transitions == null || current_state.valid_transitions.has(state.name)
