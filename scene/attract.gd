extends Node

@export var current_phase: int = 0

@onready var phase_count = get_child_count()

func _ready():
	var active_node = get_child(current_phase)
	get_children().map(func(node): _show_node(node, node == active_node))

func _on_phase_timer_timeout():
	var last_phase = current_phase
	current_phase = (current_phase + 1) % phase_count
	if current_phase != last_phase:
		_show_node(get_child(last_phase), false)
		_show_node(get_child(current_phase), true)

func _show_node(node: Node, state: bool):
	node.process_mode = Node.PROCESS_MODE_INHERIT if state else Node.PROCESS_MODE_DISABLED
	node.visible = state
