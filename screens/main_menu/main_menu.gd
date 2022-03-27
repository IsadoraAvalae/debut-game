extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene("res://screens/level/level.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
