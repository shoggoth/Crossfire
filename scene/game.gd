extends Node


var world: Node = null
var attract: Node = null
var player: Node = null

@onready var transition = $Transition


func _ready():
	attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
	transition.fade(false)


func _on_game_start():
	transition.fade(true)
	await transition.faded_out
	remove_child(attract)
	$UI.mode = "HUD"
	transition.fade(false)
	world = $World.create_instance()
	await transition.faded_in


#TODO: Remove the player param
func _on_game_over(_player):
	remove_child(world)
	if !attract.is_inside_tree(): attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
