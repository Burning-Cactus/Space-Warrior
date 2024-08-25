extends State

var frame: int = 0
var hitbox: HitBox

func enter():
	frame = 0
	
	hitbox = HitBox.new()
	hitbox.position.x = 40 * parent.direction
	
	var shape = CollisionShape2D.new()
	shape.shape = RectangleShape2D.new()
	shape.shape.size = Vector2(32, 32)
	hitbox.add_child(shape)
	
	parent.add_child(hitbox)

func update(delta: float) -> void:
	frame += 1
	if frame >= 40:
		switch_state.emit("idle")

func exit():
	parent.remove_child(hitbox)
	hitbox.queue_free()
