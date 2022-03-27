class_name Player extends Area2D

const MOVE_DOWN_ACTION := "game_plants_down"
const MOVE_UP_ACTION := "game_plants_up"

const MIN_Y_POS := 100
const MAX_Y_POS := 900

@export var move_action: String = "game_leftplant_move"
@export_color_no_alpha var player_color: Color

@export var end_xpos: float
@onready var start_xpos: float = global_position.x


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpriteBall.modulate = player_color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(move_action):
		global_position.x = lerp(global_position.x, end_xpos, delta * 1.5)
	else:
		global_position.x = lerp(global_position.x, start_xpos, delta * 3)
		
	if Input.is_action_pressed(MOVE_DOWN_ACTION)\
			and global_position.y < MAX_Y_POS:
		global_position.y += 500 * delta
		
	if Input.is_action_pressed(MOVE_UP_ACTION)\
			and global_position.y > MIN_Y_POS:
		global_position.y -= 500 * delta
