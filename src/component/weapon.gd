class_name WeaponComponent extends Node


@export var bullet_scene: PackedScene
@export var radius: float = 0
@export var pool_size: int = 0

var _pool: Array[Node2D]


func _ready():
	for _t in pool_size:
		_pool.append(bullet_scene.instantiate())


func fire(source_node: Node2D, direction: Vector2):
	var b = bullet_scene.instantiate()
	add_child(b)
	print("Shoot", bullet_scene, " from ", source_node.position, " in direction ", direction)
