extends Node


@export var current_phase: int = 0

@onready var phase_count = get_child_count()

func _ready():
	for child in get_children():
		_disable_node(child)
	_enable_node(get_child(current_phase))


func _on_phase_timer_timeout():
	var last_phase = current_phase
	current_phase = (current_phase + 1) % phase_count
	if current_phase != last_phase:
		_disable_node(get_child(last_phase))
		_enable_node(get_child(current_phase))


func _enable_node(node: Node):
	node.process_mode = Node.PROCESS_MODE_INHERIT
	node.show()


func _disable_node(node: Node):
	node.process_mode = Node.PROCESS_MODE_DISABLED
	node.hide()


