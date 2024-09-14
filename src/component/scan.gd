class_name ScanComponent extends Node2D


@export var scanning := false:
	set(value):
		scanning = value
		player_detect.enabled = scanning
@export var scan_increment := PI * 0.5

@onready var player_detect: RayCast2D = $RayCast2D

var player: Player


func _ready() -> void:
	scanning = false


func _physics_process(_delta):
	var player_direction = Vector2.RIGHT.rotated(player_detect.rotation) if player_detect.is_colliding() else Vector2.ZERO


func _on_timer_timeout() -> void:
	if scanning: player_detect.rotation += scan_increment
