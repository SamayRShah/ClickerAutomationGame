class_name ShopItem
extends PanelContainer

@export var bot : Bot
@export var player : Player

@onready var itemName: Label = %ItemName
@onready var price: Label = %Price
@onready var description: Label = %Description
@onready var button: Button = %Button
@onready var automate_button: Button = %AutomateButton
@onready var automated_panel: PanelContainer = %AutomatedPanel

func _ready() -> void:
	_on_bot_updated()
	_on_player_updated()
	automate_button.text = "Automate"
	bot.bot_updated.connect(_on_bot_updated)
	bot.bot_automated.connect(_on_bot_automated)
	player.player_updated.connect(_on_player_updated)

func _on_button_pressed() -> void:
	player.purchase_bot(bot)

func _on_player_updated() -> void:
	if(bot.price > player.score): 
		price.add_theme_color_override("font_color", Color(1,0,0))
		button.disabled = true
	else:
		price.remove_theme_color_override("font_color")
		button.disabled = false

func _on_bot_updated() -> void:
	itemName.text = bot.name
	price.text = str(bot.price)
	description.text = bot.description

func _on_automate_button_pressed() -> void:
	bot.automate(player)

func _on_bot_automated() -> void:
	automate_button.visible = false
	automated_panel.visible = true
	button.visible = false
	
