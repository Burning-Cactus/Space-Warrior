class_name HurtBox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2

func _ready() -> void:
	connect("area_entered", _on_area_entered)
	$CollisionShape2D.debug_color = Color(0.813, 0.676, 0.031, 0.42)

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null:
		return
	
	if owner.has_method("hurt"):
		owner.hurt(hitbox.damage)
