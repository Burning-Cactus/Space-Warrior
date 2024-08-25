extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer = $AnimationTimer

func _on_animation_timer_timeout() -> void:
	animated_sprite.play()

func _on_animated_sprite_2d_animation_looped() -> void:
	timer.start()
	animated_sprite.stop()
