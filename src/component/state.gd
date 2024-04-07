class_name State extends Node


signal entered_state(state: State)
signal exited_state(state: State)

var sm: StateMachine = null
var valid_transitions = null		# null => any || [] => none || check array content


func change_state(state_name: String, params := {}):
	# In case state change is called from somewhere like the entry, defer it
	(func(): sm.enter_state_named(state_name, params)).call_deferred()


func enter_from(_from: State, _params: Dictionary) -> bool:
	entered_state.emit(self)
	return true


func exit_to(_to: State) -> bool:
	exited_state.emit(self)
	return true
