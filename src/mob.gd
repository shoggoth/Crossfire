class_name Mob extends CharacterBody2D


signal mob_destroyed(Mob)

@export_group("Health")
@export var health: float = 1.0
@export var damage_factor: float = 1.0
@export var invincibility_time: float = 0

var invincible := false: set = _set_invincible
var _timer := Timer.new()


func _ready():
	_timer.one_shot = true
	_timer.name = "Invincibility Timer"
	_timer.timeout.connect(func(): invincible = false)
	add_child(_timer)


func take_damage(damage: float) -> float:
	if !invincible:
		damage *= damage_factor
		health -= damage
		print_debug("Mob %s took %f damage! health now %f" % [name, damage, health])
		if health <= 0:
			mob_destroyed.emit(self)
		else:
			invincible = invincibility_time > 0
	return health


func _set_invincible(value: bool):
	if value != invincible:
		invincible = value
		if value:
			_timer.start(invincibility_time)
		else:
			_timer.stop()
