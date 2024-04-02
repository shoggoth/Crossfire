class_name Player extends Mob


@onready var fsm = $StateMachine


func _ready():
	fsm.enter_state(fsm.get_state("Explode"), {"player" : self })
