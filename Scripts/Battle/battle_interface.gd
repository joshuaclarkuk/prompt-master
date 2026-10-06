class_name BattleInterface extends Control

@export var player_token_count_label_node: Label = null
@export var components_container_node: ComponentsContainer = null

signal on_componet_pressed(component_type: ComponentResBase)


func _ready() -> void:
	components_container_node.on_component_pressed.connect(handle_component_pressed)


func update_token_display(player_tokens: int) -> void:
	player_token_count_label_node.text = str(player_tokens)


func handle_component_pressed(prompt_type: ComponentResBase) -> void:
	on_componet_pressed.emit(prompt_type)
