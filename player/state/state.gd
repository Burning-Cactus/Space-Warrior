class_name State extends Node

var parent: CharacterBody2D

signal switch_state(name: String)

func enter() -> void:
	push_error("Unimplemented enter function in state")

func update(delta: float) -> void:
	push_error("Unimplemented update function in state")

func physics_update(delta: float) -> void:
	push_error("Unimplemented physics update function in state")

func exit():
	push_error("Unimplemented exit function in state")
