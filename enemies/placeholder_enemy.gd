extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func damage(amount: int) -> void:
	velocity.y -= 30
	print("Damaged ", amount)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
