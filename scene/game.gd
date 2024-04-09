extends Node


func _ready():
	$Attract.create_instance(true)


func _on_game_start():
	Global.disable_node($Attract, true)
	$World.show()
	$Player.show()
	$UI.mode = "HUD"


func _on_game_over(mob):
	Global.disable_node($Attract, false)
	$World.hide()
	$Player.hide()
	$UI.mode = "StartMenu"
