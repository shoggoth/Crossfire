class_name World extends Node2D


func _on_player_spawned(p: Player):
	var mc := p.get_node("MoveComponent") as MoveComponent
	print(mc)


func _on_player_destroyed(p: Player):
	p.reset()


func _on_enemy_spawned(e: Enemy):
	var aic := e.get_node("AIComponent") as AIComponent
	print(aic)


func _on_enemy_destroyed(e: Enemy):
	e.queue_free()


func _on_enemy_spawn_snapshot_changed(snap: Spawner.Snapshot):
	print(snap.active_count, " active")
	print(snap.destroyed_count, " destroyed")
	print(snap.mutation_count, " mutated")
