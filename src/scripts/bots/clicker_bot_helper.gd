class_name ClickerBotHelper
extends Bot

@export var passive_multiplier : float = 0.1

func initialize(player : Player) -> void:
	player.passiveMultiplier += passive_multiplier
	player.player_updated.emit()
	price = snapped(price * (1+price_increase), 0.01)
	count += 1
	bot_updated.emit()
