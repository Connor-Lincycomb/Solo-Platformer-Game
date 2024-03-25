extends Area2D


# this "is Player" references a class_name Player we instantiated in the player.gd script, 2nd line.
# this function restarts the scene when Player contacts the spikes
func _on_body_entered(body):
	if body is Player:
		get_tree().reload_current_scene()
