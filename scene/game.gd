extends Node


var world: Node = null
var attract: Node = null
var player: Node = null


func _ready():
	attract = $Attract.create_instance()
	$UI.mode = "StartMenu"


func _on_game_start():
	remove_child(attract)
	world = $World.create_instance()
	player = $Player.create_instance()
	$UI.mode = "HUD"


#TODO: Remove the player param
func _on_game_over(_player):
	remove_child(world)
	remove_child(player)
	if !attract.is_inside_tree(): attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
