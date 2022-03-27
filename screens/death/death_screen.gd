extends Control



func _on_restart_button_pressed() -> void:
	#var scene := preload("res://screens/level/level.tscn").instantiate()
	get_tree().change_scene("res://screens/level/level.tscn")
