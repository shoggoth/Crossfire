class_name Mob extends CharacterBody2D


signal mob_destroyed(Mob)
signal mob_changed_invincibility_state(Mob)

@export_group("Health")
@export var health: float = 1.0
@export var damage_factor: float = 1.0
@export var invincibility_time: float = -1
@export_group("Movement")
@export var speed: float = 120.0

var invincible := false: set = _set_invincible
var _invincibility_timer := Timer.new()


func _ready():
	_invincibility_timer.one_shot = true
	_invincibility_timer.name = "Invincibility Timer"
	_invincibility_timer.timeout.connect(func(): invincible = false)
	add_child(_invincibility_timer)


func take_damage(damage: float) -> float:
	if !invincible:
		damage *= damage_factor
		health -= damage
		if health <= 0:
			mob_destroyed.emit(self)
		else:
			invincible = invincibility_time > 0
	return health


func _set_invincible(value: bool):
	if value == invincible: return
	invincible = value
	mob_changed_invincibility_state.emit(self)
	_invincibility_timer.start(invincibility_time) if value else _invincibility_timer.stop()
