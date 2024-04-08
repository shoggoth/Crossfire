class_name UI extends CanvasLayer


signal start_game

var mode: String: set = _set_mode


func _ready():
	mode = "StartMenu"


func _on_button_pressed():
	start_game.emit()


func _set_mode(value: String):
	mode = value
	for child in get_children():
		if child.name == mode: child.show()
		else: child.hide()
