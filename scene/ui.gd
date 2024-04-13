class_name UI extends CanvasLayer


signal start_game

var mode: String: set = _set_mode


func _set_mode(value: String):
	mode = value
	get_children().map(func(child): if child.name == mode: child.show() else: child.hide())


func _on_new_game_pressed():
	start_game.emit()


func _on_exit_pressed():
	get_tree().quit()
