extends Node


func _ready():
	$Attract.create_instance(true)


func _on_game_start():
	Global.disable_node($Attract)
	$World.show()
	$Player.show()
	$UI.mode = "HUD"


func _on_game_over(mob):
	Global.enable_node($Attract)
	$World.hide()
	$Player.hide()
	$UI.mode = "StartMenu"
