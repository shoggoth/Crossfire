class_name HurtBox extends Area2D


@onready var parent = get_parent() as Mob


func _ready():
	# Check the parent so that we know it's Mob type and can accept them functions without a further check at collision time.
	if parent: connect("area_entered", _on_area_entered)


func _on_area_entered(area: Area2D):
	if area is HitBox:
		parent.take_damage(area.damage_dealt)
