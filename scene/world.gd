extends Node2D


func _on_player_destroyed(player: Player):
	player.queue_free()


func _on_enemy_destroyed(enemy):
	enemy.queue_free()
