class_name Bot
extends Resource

@export var name : String = "bot"
@export var price : float = 10
@export var description : String = "bot description"
@export var price_increase : float = 0.20
@export var automated : bool = false
@export var automateable : bool = true
@export var count : int = 0

signal bot_updated
signal bot_automated

func initialize(_player : Player) -> void:
	pass

func automate(_player : Player) -> void:
	automated = true
	automateable = false
	bot_automated.emit()
