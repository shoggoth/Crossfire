extends Node


var attract_node: Node = null

func _ready():
	attract_node = $Attract.create_instance()
	$UI.mode = "StartMenu"


func _on_game_start():
	remove_child(attract_node)
	$World.show()
	$Player.show()
	$UI.mode = "HUD"


func _on_game_over(_mob):
	if !attract_node.is_inside_tree():
		attract_node = $Attract.create_instance()
	$World.hide()
	$Player.hide()
	$UI.mode = "StartMenu"
