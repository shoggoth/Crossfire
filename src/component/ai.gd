class_name AIComponent extends Node


@export var state_machine: StateMachine


func _process(_delta):
	pass


func _on_state_machine_state_changed(from, to):
	print("State changed from ", from.name, " to ", to.name)
