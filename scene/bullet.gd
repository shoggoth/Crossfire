extends HitBox


@export var speed: float = 2.3

var direction: Vector2


func _ready():
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", direction, speed).as_relative()
	move_tween.tween_callback(func(): queue_free())
	if direction.y: rotation = PI * 0.5
	$Fire.play()



func _on_body_entered(body):
	if !(body is TileMapLayer): push_error("Bullet detected spurious body collision")
	queue_free()
