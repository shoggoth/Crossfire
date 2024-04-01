class_name StateMachine extends Node


@export var current_state: State = null


func _ready():
	connect("child_entered_tree", _on_child_entered_tree)
	for child in get_children():
		if child is State:
			child.sm = self
			if child == current_state:
				child.enter_from(null)
			else:
				child.process_mode = Node.PROCESS_MODE_DISABLED


func _on_child_entered_tree(child: Node):
	if child is State:
		child.process_mode = Node.PROCESS_MODE_DISABLED
		child.sm = self


func enter_state(state: State, params := {}) -> bool:
	if !can_enter_state(state as State): return false
	print_debug("%s -> %s" % [current_state.name, state.name])
	if current_state:
		current_state.process_mode = Node.PROCESS_MODE_DISABLED
		current_state.exit_to(state)
	if state && state.enter_from(current_state, params):
		state.process_mode = Node.PROCESS_MODE_INHERIT
		current_state = state
		return true
	return false


func can_enter_state(state: State) -> bool:
	return !current_state || current_state.valid_transitions == null || current_state.valid_transitions.has(state.name)
