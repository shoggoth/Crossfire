extends Node


var world: Node = null
var attract: Node = null
var player: Node = null

@onready var transition = $Transition


func _ready():
	Global.game = self
	attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
	transition.play("fade_in", Callable())


func _on_game_start():
	transition.play("fade_out", func():
		remove_child(attract)
		$UI.mode = "HUD"
		world = $World.create_instance()
		transition.play("fade_in", Callable())
		)


# TODO: Remove the player param
func _on_game_over(_player):
	remove_child(world)
	if !attract.is_inside_tree(): attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
