extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var hurtTicks = 0

func hurt(amount: int) -> void:
	damage(amount)
	modulate = Color.DARK_RED
	hurtTicks = 40

func damage(amount: int) -> void:
	velocity.y -= 30
	print("Damaged ", amount)

func _process(delta):
	if hurtTicks > 0:
		hurtTicks -= 1
	else:
		modulate = Color.WHITE

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
