class_name ScanComponent extends Node


@export var scanning := false
@export var player_detect: RayCast2D

var player: Player


func _ready() -> void:
	player_detect.enabled = scanning


func _physics_process(_delta):
	var player_direction = Vector2.RIGHT.rotated(player_detect.rotation) if player_detect.is_colliding() else Vector2.ZERO


func _on_timer_timeout() -> void:
	player_detect.rotation += PI * 0.5
