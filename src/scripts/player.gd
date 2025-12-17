class_name Player
extends Resource

@export var score : float = 0
@export var clickSpeed : float = 1
@export var passiveRate : float = 0
@export var passiveMultiplier : float = 1
@export var bots : Array[Bot]

signal player_updated

func _clickButton() -> void:
	score = snapped(score + clickSpeed, 0.01)
	player_updated.emit()

func purchase_bot(bot : Bot) -> void:
	if score < bot.price: return
	score = snapped(score - bot.price, 0.01)
	bot.initialize(self)
	player_updated.emit()
