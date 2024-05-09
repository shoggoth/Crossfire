class_name WeaponComponent extends Node


@export var bullet_scene: PackedScene
@export var radius: float = 0
@export var pool_size: int = 0

var can_fire := true

var _pool: Array[Node2D]


func _ready():
	for _t in pool_size:
		_pool.append(bullet_scene.instantiate())


func fire(source_node: Node2D, direction: Vector2):
	can_fire = false
	$Timer.start()
	var b = bullet_scene.instantiate()
	b.direction = direction * 120 # TODO: Move range
	b.position = source_node.position + direction * radius
	add_child(b)
	print("Shoot", b, " from ", source_node.position, " in direction ", direction)


func _on_timer_timeout():
	can_fire = true
