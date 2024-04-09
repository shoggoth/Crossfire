extends Node


func disable_node(node: Node, disabled: bool):
	if disabled:
		node.process_mode = Node.PROCESS_MODE_DISABLED
		node.hide()
	else:
		node.process_mode = Node.PROCESS_MODE_INHERIT
		node.show()
