class_name BattleManager extends Node2D

@export_category("Required Nodes")
@export var battle_interface_node: BattleInterface = null

var player_tokens: int = 3
var enemy_tokens: int = 3

var is_battle_active: bool = false


func _ready() -> void:
	EventBus.on_component_pressed.connect(handle_component_pressed)

	update_battle_interface()


func update_battle_interface() -> void:
	battle_interface_node.update_token_display(player_tokens)


func handle_component_pressed(component: ComponentResBase, is_selected: bool) -> void:
	if is_selected:
		player_tokens -= component.component_cost
	else:
		player_tokens += component.component_cost

	update_battle_interface()

	print("%s: prompt pressed: %s" % [name, component.component_title])
