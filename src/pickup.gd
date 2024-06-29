class_name Pickup extends Area2D


signal picked_up(pickup: Pickup)

enum PickupType { LANTERN }

var type: PickupType
var score_value: int


func display_score_label():
	$Sprite2D.hide()
	var tn = TextNode.new()
	tn.text = str(score_value)
	add_child(tn)


func _on_body_entered(_body):
	display_score_label()
	#picked_up.emit(self)
