class_name Player extends Area2D

const MOVE_DOWN_ACTION := "game_plants_down"
const MOVE_UP_ACTION := "game_plants_up"

const MIN_Y_POS := 100
const MAX_Y_POS := 900

var _motion: Vector2
var _is_bright_color := false

@export var move_action: String = "game_leftplant_move"
@export_color_no_alpha var player_color: Color
@export_color_no_alpha var player_bright_color: Color

@export var gravity_vector: Vector2
@export var horizontal_range: Vector2
@export var acceleration: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpriteBall.modulate = player_color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(move_action):
		_motion += acceleration
	else:
		_motion += gravity_vector
	
	_motion = _motion.limit_length(1000)
	
	translate(_motion * delta)
	
	if global_position.x < horizontal_range.x:
		global_position.x = horizontal_range.x
		_motion = Vector2.ZERO
	elif global_position.x > horizontal_range.y:
		global_position.x = horizontal_range.y
		_motion = Vector2.ZERO
		
	if Input.is_action_pressed(MOVE_DOWN_ACTION)\
			and global_position.y < MAX_Y_POS:
		global_position.y += 500 * delta

	if Input.is_action_pressed(MOVE_UP_ACTION)\
			and global_position.y > MIN_Y_POS:
		global_position.y -= 500 * delta


func _on_check_area_area_entered(area: Area2D) -> void:
	$FlashTimer.start()


func _on_check_area_area_exited(area: Area2D) -> void:
	$FlashTimer.stop()
	_is_bright_color = false
	$SpriteBall.modulate = player_color


func _on_flash_timer_timeout() -> void:
	if _is_bright_color:
		_is_bright_color = false
		$SpriteBall.modulate = player_color
	else:
		_is_bright_color = true
		$SpriteBall.modulate = player_bright_color
