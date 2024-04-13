class_name UI extends CanvasLayer


signal start_game

var mode: String: set = _set_mode


func _on_button_pressed():
	start_game.emit()


func _set_mode(value: String):
	mode = value
	get_children().map(func(child): if child.name == mode: child.show() else: child.hide())



class SelectionMenu extends Control:
	
	@export var ui: UI
	
	var selection_items: Array[Node]
	var selection_index: int:
		set(value):
			selection_index = clamp(value, 0, selection_items.size() - 1)
			selection_items.map(func(node): node.modulate.a = 0.3)
	
	
	func _ready():
		selection_items = get_children()
		selection_index = 0
	
	
	func _input(event):
		print(event)
