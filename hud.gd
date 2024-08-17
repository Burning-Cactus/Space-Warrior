extends CanvasLayer


func _on_player_health_changed(new_health: int) -> void:
	$HBoxContainer/HPBar.value = new_health
