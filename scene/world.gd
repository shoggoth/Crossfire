class_name World extends Node2D


signal score_changed(by: int)

var total_score: int = 0


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
	total_score += 2 ** e.type * 10
	score_changed.emit(total_score)
	%Score.text = str(total_score)


func _on_enemy_spawn_snapshot_changed(snap: Spawner.Snapshot):
	print(snap.active_count, " active")
	print(snap.destroyed_count, " destroyed")
	print(snap.mutation_count, " mutated")
