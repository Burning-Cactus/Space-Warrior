extends State

func enter() -> void:
	if parent.is_on_floor():
		parent.velocity.y = parent.JUMP_VELOCITY
	elif parent.air_jumps > 0:
		parent.air_jumps -= 1
		parent.velocity.y = parent.JUMP_VELOCITY

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta

func exit() -> void:
	pass
