class_name ScanComponent extends Node2D


@export var scanning := false:
	set(value):
		scanning = value
		player_ray_detect.enabled = scanning
		player_area_detect.monitoring = scanning
@export var scan_increment := PI * 0.5

@onready var player_ray_detect: RayCast2D = $RayCast2D
@onready var player_area_detect: Area2D = $Area2D

var player: Player


func _ready() -> void:
	scanning = false


func _physics_process(_delta):
	var player_direction = Vector2.RIGHT.rotated(player_ray_detect.rotation) if player_ray_detect.is_colliding() else Vector2.ZERO


func _on_timer_timeout() -> void:
	if scanning: player_ray_detect.rotation += scan_increment


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, " - ", player)
