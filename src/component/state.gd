class_name State extends Node


var sm: StateMachine = null


func _process(_delta):
	pass


func _physics_process(_delta):
	pass


func enter_from(_from: State, _params := {}) -> bool:
	return true


func exit_to(_to: State) -> bool:
	return true
