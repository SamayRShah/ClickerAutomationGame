class_name ClickerBot
extends Bot

@export var passive_rate : float = 0.01
@export var clicker_scene : PackedScene

func initialize(player : Player) -> void:
	player.passiveRate += passive_rate
	player.player_updated.emit()
	price = snapped(price * (1+price_increase), 0.01)
	_load_bot()
	count += 1
	bot_updated.emit()

func _load_bot() -> void:
	if(count >= 72): return
	var main_loop = Engine.get_main_loop()
	if main_loop is not SceneTree: return
	var tree = main_loop as SceneTree
	var area = tree.get_first_node_in_group("clicker_area")
	area.add_child(clicker_scene.instantiate())
