extends Node


var game: Node
var player: Player:
	get: return game.world.player

func quantise(vec: Vector2) -> Vector2:
	if vec.x && vec.y: vec.x = 0
	return vec
