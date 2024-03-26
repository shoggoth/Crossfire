class_name State extends Node


var sm: StateMachine = null


func _process(delta):
	print_debug(name, " _process ", delta)


func _physics_process(delta):
	print_debug(name, " _physics_process ", delta)


func enter_from(from: State, params := {}) -> bool:
	return true


func exit_to(to: State) -> bool:
	return true
