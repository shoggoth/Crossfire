extends Node


@export var current_phase: int = 0

@onready var phase_count = get_child_count()

func _ready():
	for child in get_children():
		Global.disable_node(child)
	Global.enable_node(get_child(current_phase))


func _on_phase_timer_timeout():
	var last_phase = current_phase
	current_phase = (current_phase + 1) % phase_count
	if current_phase != last_phase:
		Global.disable_node(get_child(last_phase))
		Global.enable_node(get_child(current_phase))
	

