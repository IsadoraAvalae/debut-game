class_name Level extends Node

const OBSTACLE_SCENE := preload("res://actors/obstacle/obstacle.tscn")

@export var scroll_speed: float = 100

@onready var background := $Background as ParallaxBackground
@onready var spawn_timer := $SpawnTimer as Timer

@onready var score_text := $HUD/HUDRoot/HBoxContainer/ScoreLabel as Label
@onready var hiscore_text := $HUD/HUDRoot/HBoxContainer/HiScoreLabel as Label

@onready var plant1 := $LeftPlant as Player

var score: float = 0
var is_player_protected := false

var _current_obstacle_speed := 200.0
var _powerup_types: Array
var _is_obstacle_left := false


func _enter_tree() -> void:
	Globals.level = self
	

func _exit_tree() -> void:
	Globals.level = null


func _ready() -> void:
	hiscore_text.text = "HiScore: %d" % Globals.highscore
	_powerup_types.append(load("res://actors/powerup/protection_powerup.tscn"))
	_powerup_types.append(load("res://actors/powerup/powerup_score.tscn"))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	background.scroll_offset.y += scroll_speed * delta
	
	score += delta * 150 * inverse_lerp(Player.MAX_Y_POS, Player.MIN_Y_POS, plant1.global_position.y)
	score_text.text = "Score: %d" % score


func _on_spawn_timer_timeout() -> void:
	var instance := OBSTACLE_SCENE.instantiate() as Area2D
	instance.global_position = Vector2(randf_range(0, 600), -200)
	instance.move_speed = _current_obstacle_speed
	instance.is_left = _is_obstacle_left
	_is_obstacle_left = !_is_obstacle_left
	
	add_child(instance)
	
	if spawn_timer.wait_time > 0.2:
		spawn_timer.wait_time -= 0.005
		
	_current_obstacle_speed += 5
	
	if randi() % 20 <= 1:
		var powerup_type: PackedScene = _powerup_types[randi() % _powerup_types.size()]
		var powerup_instance: Powerup = powerup_type.instantiate()
		powerup_instance.global_position = Vector2(randf_range(0, 600), -100)
		
		add_child(powerup_instance)


func _on_plant_area_entered(area: Area2D) -> void:
	if is_player_protected:
		area.queue_free()
		is_player_protected = false
		return
	
	if score > Globals.highscore:
		Globals.highscore = score
	
	get_tree().change_scene("res://screens/death/death_screen.tscn")
