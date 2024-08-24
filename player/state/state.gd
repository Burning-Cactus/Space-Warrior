class_name State extends Node

var parent: CharacterBody2D

signal switch_state(name: String)

func init(_parent: CharacterBody2D) -> void:
	parent = _parent

func enter() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func exit():
	pass
