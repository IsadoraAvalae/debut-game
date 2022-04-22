extends Node

var highscore: float = 0
var level: Level


func _enter_tree() -> void:
	var file := File.new()
	if file.open("user://highscore.dat", File.READ) != OK:
		push_error("Could not open file to load highscore")
		return
		
	highscore = file.get_float()
	file.close()


func _exit_tree() -> void:
	var file := File.new()
	if file.open("user://highscore.dat", File.WRITE) != OK:
		push_error("Could not open file to save highscore")
		return
		
	file.store_float(highscore)
	file.close()
