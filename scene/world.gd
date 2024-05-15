extends Node2D


func _on_player_destroyed(player: Player):
	player.queue_free()
