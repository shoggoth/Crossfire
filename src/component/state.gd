class_name State extends Node


var sm: StateMachine = null
var valid_transitions = null		# null => any || [] => none || check array content

func _process(_delta):
	pass


func _physics_process(_delta):
	pass


func change_state(state_name: String, params := {}):
	# In case state change is called from somewhere like the entry, defer it
	(func(): sm.enter_state_named(state_name, params)).call_deferred()


func enter_from(_from: State, _params := {}) -> bool:
	print_debug(name, " state entered")
	return true


func exit_to(_to: State) -> bool:
	print_debug(name, " state exiting")
	return true
