extends Node2D


func _ready():
	$EnemySpawn.snapshot.player = $Player		# TODO: Handle player respawn


func _on_player_destroyed(player: Player):
	player.queue_free()


func _on_enemy_destroyed(enemy):
	enemy.queue_free()


func _on_enemy_spawn_snapshot_changed(snapshot):
	print(snapshot.destroyed_count, " destroyed")
	print(snapshot.player, " player")
