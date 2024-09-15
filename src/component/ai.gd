class_name AIComponent extends Node


@export_group("Capabilities")
@export var intelligence := 4

@export_group("Control")
@export var state_machine: StateMachine

@onready var enemy: Enemy = get_parent()
@onready var weapon = enemy.get_node("WeaponComponent")

var _thinking_time = 0.0


func _process(delta):
	_thinking_time += delta
	if _thinking_time > intelligence:
		#if is_instance_valid(player): print("Player = ", Global.grid_position(player))
		match state_machine.current_state.name:
			"Hide": state_machine.enter_state_named("Lurk")
		_thinking_time -= intelligence


func _on_state_machine_state_changed(_from, _to):
	pass


func _on_move_component_finished_moving(_mc):
	#print("Self = ", Global.grid_position(state_machine.get_meta("parent_node")))
	match state_machine.current_state.name:
		"Lurk":
			state_machine.enter_state_named("Track", { "destination" : Vector2(3, 3), "prioritise_x" : enemy.spawn_pos.y != 0 })
		#"Move": state_machine.enter_state_named("Wander")
		#"Track": state_machine.enter_state_named("Track", { "destination" : Vector2(randi_range(1, 6), randi_range(1, 5)) })
		"Track":
			#if player_direction:
				#state_machine.enter_state_named("Fire", { "direction" : player_direction })
			#else:
			state_machine.enter_state_named("Track", { "destination" : Vector2(randi_range(1, 6), randi_range(1, 5)) })
		#"Wander": state_machine.enter_state_named("Track")
		#"Track": state_machine.enter_state_named("Wander")
	#ray_cast.rotation += PI * 0.5


func _on_weapon_component_weapon_fired(_source_node, _direction):
	state_machine.enter_state_named("Track", { "destination" : Vector2(randi_range(1, 6), randi_range(1, 5)) })


func _on_weapon_component_weapon_ready():
	state_machine.enter_state_named("Track", { "destination" : Vector2(randi_range(1, 6), randi_range(1, 5)) })


func _on_scan_component_threat_detected(direction: Vector2) -> void:
	if direction:
		state_machine.enter_state_named("Fire", { "direction" : direction })
