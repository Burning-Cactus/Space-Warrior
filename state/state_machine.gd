class_name StateMachine extends Node


@export var initial_state: State

var states : Dictionary = {}
var current_state: State: set = set_state

func init(_parent: CharacterBody2D):
	for state in get_children():
		assert(state is State, "ERROR: Non-state node assigned to state machine.")
		states[state.name.to_lower()] = state
		state.init(_parent)
		state.switch_state.connect(_on_switch_state)
	if !initial_state:
		initial_state = get_children()[0]
	current_state = initial_state

func set_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	new_state.enter()

func update(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func physics_update(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func _on_switch_state(name: String) -> void:
	var new_state: State = states[name]
	current_state = new_state
	print("New state: ", name)
