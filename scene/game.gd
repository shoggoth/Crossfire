extends Node


var world: Node = null
var attract: Node = null


func _ready():
	attract = $Attract.create_instance()
	$UI.mode = "StartMenu"


func _on_game_start():
	remove_child(attract)
	world = $World.create_instance()
	$Player.show()
	$UI.mode = "HUD"


#TODO: Remove the player param
func _on_game_over(_player):
	if !attract.is_inside_tree():
		attract = $Attract.create_instance()
	remove_child(world)
	$Player.hide()
	$UI.mode = "StartMenu"
