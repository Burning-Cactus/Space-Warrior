extends StateMachine


func update(delta: float) -> void:
	super(delta)
	if Input.is_action_just_pressed("weak_attack"):
		_on_switch_state("attack")
