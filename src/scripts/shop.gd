extends Control

@export var item_scene : PackedScene
@export var player : Player

@onready var shop: VBoxContainer = %Shop

func _ready() -> void:	
	for bot : Bot in player.bots:
		var newItem : ShopItem = item_scene.instantiate()
		newItem.bot = bot
		newItem.player = player
		shop.add_child(newItem)
