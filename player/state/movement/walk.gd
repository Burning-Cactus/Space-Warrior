extends State

func enter() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var next_state: String
	
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta
	
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.SPEED)
	
	if Input.is_action_just_pressed("jump"):
		next_state = "jump"
	elif parent.velocity.x == 0:
		next_state = "idle"
	
	if next_state:
		switch_state.emit(next_state)
	

func exit() -> void:
	pass
