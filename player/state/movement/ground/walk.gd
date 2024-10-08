extends "on_ground.gd"

func physics_update(delta: float) -> void:
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
		parent.direction = 1 if direction >= 0 else -1
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.SPEED)
		if parent.velocity.x == 0:
			switch_state.emit("idle")
