extends Powerup


func _perform_powerup(player: Player) -> void:
	Globals.level.score += 800
