class_name State extends Node


var sm: StateMachine = null


func enter_from(from: State) -> bool:
	return true


func exit_to(to: State) -> bool:
	return true
