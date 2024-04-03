extends Node


var d_pad = Vector2.ZERO
var fire = false


func _process(_delta):
	fire =  Input.is_action_just_pressed("fire")
	d_pad = Input.get_vector("left", "right", "up", "down")
