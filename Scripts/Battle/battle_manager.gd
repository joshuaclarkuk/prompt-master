class_name BattleManager extends Node2D

@export_category("Required Nodes")
@export var battle_interface_node: BattleInterface = null

@export_category("Battle Variables")
var max_stability_player: int = 100
var max_stability_enemy: int = 100
var max_tokens_player: int = 5

var current_stability_player: int = 0
var current_stability_enemy: int = 0
var curret_tokens_player: int = 3

var is_battle_active: bool = false


func _ready() -> void:
	EventBus.on_component_pressed.connect(handle_component_pressed)

	current_stability_player = max_stability_player

	update_battle_interface()


func update_battle_interface() -> void:
	battle_interface_node.update_token_display(curret_tokens_player)


func handle_component_pressed(component: ComponentResBase, is_selected: bool) -> void:
	if is_selected:
		curret_tokens_player -= component.component_cost
	else:
		curret_tokens_player += component.component_cost

	update_battle_interface()

	print("%s: prompt pressed: %s" % [name, component.component_title])
