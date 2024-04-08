extends Node


func _on_game_start():
	$Attract.hide()
	$World.show()
	$Player.show()
	$UI.mode = "HUD"


func _on_game_over(mob):
	$Attract.show()
	$World.hide()
	$Player.hide()
	$UI.mode = "StartMenu"
