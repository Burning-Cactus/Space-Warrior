extends "in_air.gd"

func enter() -> void:
	if parent.is_on_floor():
		parent.velocity.y = parent.JUMP_VELOCITY
	elif parent.air_jumps > 0:
		parent.air_jumps -= 1
		parent.velocity.y = parent.JUMP_VELOCITY

func physics_update(delta: float) -> void:
	super(delta)
	if parent.velocity.y <= 0:
		switch_state.emit('fall')
