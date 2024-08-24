extends State


func physics_update(delta: float) -> void:
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta
	else:
		switch_state.emit('idle')
