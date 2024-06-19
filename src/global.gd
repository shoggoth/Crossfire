extends Node


var game: Node
var player: Player:
	get: return game.world.player


func quantise(vec: Vector2) -> Vector2:
	if vec.x && vec.y: vec.x = 0
	return vec


func toggle_meta(obj: Object, meta: String, value = true) -> bool:
	if !obj.get_meta(meta, false):
		obj.set_meta(meta, value)
		return true
	else:
		obj.remove_meta(meta)
		return false
