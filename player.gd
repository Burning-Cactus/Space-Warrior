extends CharacterBody2D


signal health_changed(new_health: int)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var max_air_jumps: int = 1
var air_jumps := max_air_jumps

var max_hp: int = 100
var hp := max_hp - 40

func damage(amount) -> void:
	hp -= amount
	health_changed.emit(hp)

func _process(delta: float):
	if Input.is_action_just_pressed("weak_attack"):
		damage(2)


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		air_jumps = max_air_jumps
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif air_jumps > 0:
			air_jumps -= 1
			velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
