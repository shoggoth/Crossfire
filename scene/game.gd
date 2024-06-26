extends Node


var _world: World
var _attract: Node

@onready var transition = $Transition


func _ready():
	_attract = $Attract.create_instance()
	$UI.mode = "StartMenu"
	transition.play("fade_in", Callable())


func _on_game_start():
	transition.play("fade_out", func():
		remove_child(_attract)
		$UI.mode = "Hidden"
		_world = $World.create_instance()
		_world.score_changed.connect(_on_world_score_changed)
		_world.game_over.connect(_on_game_over)
		transition.play("fade_in", Callable())
		)


func _on_game_over(_score: int):
	remove_child(_world)
	if !_attract.is_inside_tree(): _attract = $Attract.create_instance()
	$UI.mode = "StartMenu"


func _on_world_score_changed(by):
	print("Score: ", by)
