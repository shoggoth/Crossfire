extends Node


func enable_node(node: Node):
	node.process_mode = Node.PROCESS_MODE_INHERIT
	node.show()


func disable_node(node: Node):
		node.process_mode = Node.PROCESS_MODE_DISABLED
		node.hide()
