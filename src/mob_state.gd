class_name MobState extends State


var input:
	get: return mob.input

@onready var mob = get_node("../..") as Mob


func play(animation):
	print(mob, " play anim: ", animation)

func move(delta, flip = true, direction = input.d_pad):
	# Accelerate
	mob.velocity = mob.velocity.move_toward(mob.speed * direction, mob.accel * delta)
	mob.velocity = direction * mob.speed
	mob.move_and_slide()
