class_name BattleScreen extends Node2D

@export_category("Required Nodes")
@export var battle_interface_node: BattleInterface = null

var player_tokens: int = 3
var enemy_tokens: int = 3

var player_max_tokens: int = 5
var enemy_max_tokens: int = 5

var is_battle_active: bool = false


func _ready() -> void:
	battle_interface_node.on_componet_pressed.connect(handle_prompt_pressed)

	battle_interface_node.update_token_display(player_tokens)


func update_battle_interface() -> void:
	battle_interface_node.update_token_display(player_tokens)


func handle_prompt_pressed(prompt_type: ComponentResBase) -> void:
	player_tokens -= prompt_type.component_cost
	print("%s: prompt pressed: %s" % [name, prompt_type])
