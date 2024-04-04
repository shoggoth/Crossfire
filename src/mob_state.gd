class_name MobState extends State


@export var mob_path: NodePath = "../.."

@onready var mob = get_node(mob_path) as Mob


func play(animation):
	print(mob, " play anim: ")

func move(delta, flip = true, direction = mob.input.d_pad):
	# Accelerate
	mob.velocity = mob.velocity.move_toward(mob.speed * direction, mob.accel * delta)
	mob.velocity = direction * mob.speed
	mob.move_and_slide()
