extends CharacterBody2D


var state_machine

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var max_air_jumps: int = 1
var air_jumps := max_air_jumps

signal health_changed(new_health: int)
var max_hp: int = 100
var hp := max_hp - 40

func _ready():
	state_machine = $StateMachine
	state_machine.init(self)

func hurt():
	pass

func damage(amount):
	if hp > 0:
		hp -= amount
		health_changed.emit(hp)

func heal(amount):
	if hp > max_hp:
		hp += amount
		health_changed.emit(hp)

func _process(delta: float):
	state_machine.update(delta)
	#if Input.is_action_just_pressed("weak_attack"):
		#damage(2)
	if position.y > 3000:
		position.y = 0


func _physics_process(delta: float) -> void:
	if is_on_floor():
		air_jumps = max_air_jumps
	state_machine.physics_update(delta)
	move_and_slide()
