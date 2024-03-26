class_name StateMachine extends Node


@export var current_state: State = null


func _ready():
	for child in get_children():
		if child is State:
			child.sm = self
			if child == current_state:
				child.enter_from(null)
			else:
				child.process_mode = Node.PROCESS_MODE_DISABLED
	connect("child_entered_tree", _on_child_entered_tree)


func _on_child_entered_tree(node: Node):
	print_debug(node, " entered tree")


func enter_state(node_name: String, params := {}) -> bool:
	var state = get_node(node_name) as State
	if !state || !can_enter_state(state): return false
	if current_state:
		current_state.process_mode = Node.PROCESS_MODE_DISABLED
		current_state.exit_to(state)
	if state.enter_from(current_state, params):
		state.process_mode = Node.PROCESS_MODE_INHERIT
		current_state = state
		return true
	return false


func can_enter_state(state: State) -> bool:
	return state != null
