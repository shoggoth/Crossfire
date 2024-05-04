extends HitBox


@export var speed: float = 10.0

var direction = Vector2.RIGHT * 100


func _ready():
	var move_tween = create_tween()
	move_tween.tween_property(self, "position", self.position + direction, speed)
	move_tween.tween_callback(func(): queue_free())
