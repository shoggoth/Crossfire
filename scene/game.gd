extends Node


var world: World = null
var attract: Node = null
var score: int = 0

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
		world.score_changed.connect(_on_world_score_changed)
		transition.play("fade_in", Callable())
		)


# TODO: Remove the player param
func _on_game_over(_player):
	remove_child(world)
	if !attract.is_inside_tree(): attract = $Attract.create_instance()
	$UI.mode = "StartMenu"


func _on_world_score_changed(by):
	print("Score: ", by)
