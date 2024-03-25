class_name HurtBox extends Area2D


@onready var parent = get_parent() as Mob


func _ready():
	if parent: connect("area_entered", _on_area_entered)


func _on_area_entered(hitbox: Area2D):
	if hitbox is HitBox:
		parent.take_damage(hitbox.damage_dealt)
