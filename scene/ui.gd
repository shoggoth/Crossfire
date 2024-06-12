class_name UI extends CanvasLayer


signal start_game

var mode: String: set = _set_mode
var _saved_mode: String


func _ready():
	mode = "StartMenu"


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		mode = "PauseMenu"
		get_tree().paused = true


func _set_mode(value: String):
	if value == mode: return
	_saved_mode = mode
	mode = value
	get_children().map(func(child): child.visible = child.name == mode)


func _on_continue_pressed():
	# StartMenu - Continue button
	start_game.emit()


func _on_new_game_pressed():
	# StartMenu - New Game button
	start_game.emit()


func _on_options_pressed():
	# StartMenu - Options button
	print_debug("NYA - Options")


func _on_exit_pressed():
	# StartMenu - Exit button
	get_tree().quit()


func _on_resume_pressed():
	# PauseMenu - Resume button
	get_tree().paused = false
	mode = _saved_mode


func _on_main_menu_pressed():
	# PauseMenu - MainMenu button
	mode = "StartMenu"
