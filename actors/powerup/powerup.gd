class_name Powerup extends Area2D

var _move_speed: float


func _ready() -> void:
	_move_speed = randf_range(100, 300)


func _process(delta: float) -> void:
	global_position.y += _move_speed * delta
	if global_position.y > 1500:
		queue_free()


func _perform_powerup(player: Player) -> void:
	pass


func _on_powerup_area_entered(area: Area2D) -> void:
	if area is Player:
		queue_free()
		_perform_powerup(area as Player)
