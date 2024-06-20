class_name Pickup extends Area2D


signal picked_up(pickup: Pickup)

enum PickupType { LANTERN }

var type: PickupType
var score_value: int


func _on_body_entered(_body):
	picked_up.emit(self)
