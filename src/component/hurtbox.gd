class_name HurtBox extends Area2D


@onready var parent = get_parent() as Mob


func _ready():
	if parent: connect("area_entered", _on_area_entered)


func _on_area_entered(area: Area2D):
	if area is HitBox:
		parent.take_damage(area.damage_dealt)
