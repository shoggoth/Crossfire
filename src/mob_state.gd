class_name MobState extends State


@onready var mob = get_node("../..") as Mob


func play(animation):
	print(mob, " play anim: ", animation)
