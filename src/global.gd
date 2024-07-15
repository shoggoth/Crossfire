extends Node


const GRID_SIZE = Vector2(32, 32)
const GRID_OFFSET = Vector2(0.25, 0.25)

var small_font: Font = load("res://gfx/SmallFont.png")


func grid_position(node: Node2D) -> Vector2:
	return node.global_position / GRID_SIZE - GRID_OFFSET


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
