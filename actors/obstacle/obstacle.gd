extends Area2D

const LEFT_COLOR := Color.GREEN
const RIGHT_COLOR := Color.CYAN

var move_speed: float
var is_left: bool

func _ready() -> void:
	if is_left:
		modulate = LEFT_COLOR
		set_collision_layer_value(2, true)
	else:
		modulate = RIGHT_COLOR
		set_collision_layer_value(4, true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.y += move_speed * delta
	
	if global_position.y > 1400:
		queue_free()
