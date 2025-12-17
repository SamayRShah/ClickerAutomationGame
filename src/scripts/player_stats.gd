extends Panel

@export var player : Player

@onready var passive_rate: Label = %PassiveRate
@onready var click_rate: Label = %ClickRate
@onready var passive_multiplier: Label = %PassiveMultiplier

func _ready() -> void:
	_on_player_updated()
	player.player_updated.connect(_on_player_updated)

func _on_player_updated() -> void:
	passive_rate.text = "Passive Rate: " + str(player.passiveRate)+ "/s"
	click_rate.text = "Click Rate: " + str(player.clickSpeed)
	passive_multiplier.text = "Passive Multiplier: " + str(player.passiveMultiplier)
