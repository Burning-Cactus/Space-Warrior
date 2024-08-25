extends Area2D

enum type { HEAL }
var action: type

func _ready() -> void:
	action = type.HEAL

func _on_area_entered(area: Area2D) -> void:
	print("Entered pickup")
	if area == null:
		return
	
	var player = area.owner
	match action:
		type.HEAL:
			if player.has_method("heal"):
				player.heal(30)
	
	queue_free()
