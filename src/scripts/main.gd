class_name Main
extends Control

@export var player : Player
@onready var button: Button = %Button
@onready var clicker_holder: Control = %ClickerHolder
@onready var score: Label = %Score

func _ready() -> void:
	player.player_updated.connect(_updatePlayer)

var ticker : float = 0
func _process(delta: float) -> void:
	ticker += delta
	if ticker < 1: return
	
	ticker = 0
	player.score += snapped(player.passiveRate * player.passiveMultiplier, .01)
	for bot : Bot in player.bots:
		if(!bot.automated): continue
		if(player.score > bot.price): player.purchase_bot(bot)
	player.player_updated.emit()

func _updatePlayer() -> void:
	score.text = str(player.score)

func _on_button_pressed() -> void:
	player._clickButton()
