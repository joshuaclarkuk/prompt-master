class_name BattleInterface extends Control

signal on_componet_pressed(component_type: ComponentResBase)

@export var health_token_ui_node: HealthTokenUI = null
@export var components_container_node: ComponentsContainer = null

var player_token_count_label_node: Label = null


func _ready() -> void:
	components_container_node.on_component_pressed.connect(handle_component_pressed)


func update_token_display(player_tokens: int) -> void:
	health_token_ui_node.get_player_token_count_node().text = str(player_tokens)


func handle_component_pressed(prompt_type: ComponentResBase) -> void:
	on_componet_pressed.emit(prompt_type)
