class_name UI extends CanvasLayer


signal start_game

var mode: String: set = _set_mode


func _on_continue_pressed():
	# StartMenu - Continue button
	print_debug("NYA")


func _on_new_game_pressed():
	# StartMenu - New Game button
	start_game.emit()


func _on_options_pressed():
	# StartMenu - Options button
	print_debug("NYA")


func _on_exit_pressed():
	# StartMenu - Exit button
	get_tree().quit()


func _set_mode(value: String):
	mode = value
	get_children().map(func(child): if child.name == mode: child.show() else: child.hide())
