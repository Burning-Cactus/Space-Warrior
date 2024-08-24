extends State

func update(delta: float) -> void:
	super(delta)
	
	if not parent.is_on_floor():
		switch_state.emit("fall")
	
	if Input.is_action_just_pressed("jump"):
		switch_state.emit("jump")
