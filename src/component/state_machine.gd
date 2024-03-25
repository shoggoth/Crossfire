class_name StateMachine extends Node


@export var current_state: State = null


func _ready():
	for child in get_children():
		(child as State).sm = self
		child.process_mode = Node.PROCESS_MODE_DISABLED
	if current_state: current_state.enter_from(null)


func enter_state(name: String) -> bool:
	var state = get_node(name) as State
	if !state || !can_enter_state(state): return false
	if current_state: current_state.exit_to(state)
	if state.enter_from(current_state):
		state.process_mode = Node.PROCESS_MODE_INHERIT
		current_state = state
		return true
	return false


func can_enter_state(state: State) -> bool:
	return true

# TODO: Handle current state processing switches
# TODO: Handle enter and exit tree signals
