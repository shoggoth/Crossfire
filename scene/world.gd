class_name World extends Node2D


signal score_changed(by: int)
signal game_over(score: int)

var men_left: int = 3
var total_score: int = 0:
	set(value):
		total_score = value
		score_changed.emit(total_score)
		%Score.text = str(total_score)


func _on_player_spawned(p: Player):
	var mc := p.get_node("MoveComponent") as MoveComponent
	print(mc)


func _on_player_destroyed(p: Player):
	men_left -= 1
	if men_left:
		p.reset()
		%Men.text = str(men_left)
	else:
		p.queue_free()
		game_over.emit(total_score)


func _on_enemy_spawned(e: Enemy):
	var aic := e.get_node("AIComponent") as AIComponent
	aic.player = $Player


func _on_enemy_destroyed(e: Enemy):
	e.queue_free()
	total_score += 2 ** e.type * 10


func _on_picked_up_lantern(lantern: Pickup):
	total_score += lantern.score_value
	lantern.queue_free()


func _on_enemy_spawn_snapshot_changed(snap: Spawner.Snapshot):
	print(snap.active_count, " active")
	print(snap.destroyed_count, " destroyed")
	print(snap.mutation_count, " mutated")
