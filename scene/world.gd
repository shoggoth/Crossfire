class_name World extends Node2D


func _on_player_destroyed(p: Player):
	p.queue_free()


func _on_enemy_spawned(e: Enemy):
	var aic := e.get_node("AIComponent") as AIComponent
	print(aic)


func _on_enemy_destroyed(e: Enemy):
	e.queue_free()


func _on_enemy_spawn_snapshot_changed(snapshot):
	print(snapshot.active_count, " active")
	print(snapshot.destroyed_count, " destroyed")
	print(snapshot.mutation_count, " mutated")
