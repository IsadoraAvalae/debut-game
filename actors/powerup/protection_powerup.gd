extends Powerup


func _perform_powerup(player: Player) -> void:
	Globals.level.is_player_protected = true
