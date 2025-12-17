class_name ClickerHelperBot
extends Bot

@export var speed_increase : float = 0.2

func initialize(player : Player) -> void:
	player.clickSpeed = snapped(player.clickSpeed * (1 + speed_increase), 0.01)
	player.player_updated.emit()
	price = snapped(price * (1+price_increase), 0.01)
	count += 1
	bot_updated.emit()
