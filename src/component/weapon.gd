class_name WeaponComponent extends Node


@export var radius: float = 0


func fire(source_node: Node2D, direction: Vector2):
	print("Shoot from", source_node.position, " in direction ", direction)
