extends Area2D

var move_speed: float

func _ready() -> void:
	$SpriteHuman.modulate = Color(
		randf_range(0.5, 1),
		randf_range(0.5, 1),
		randf_range(0.5, 1)
	)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += move_speed * delta
	
	if global_position.y > 1400:
		queue_free()
