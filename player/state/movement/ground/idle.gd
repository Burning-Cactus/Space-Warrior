extends "on_ground.gd"


func physics_update(delta) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		switch_state.emit("walk")
