class_name BattleInterface extends Control

@export var token_progress_bar_node: ProgressBar = null
@export var token_count_label_node: Label = null
@export var prompts_container_node: ComponentsContainer = null

signal on_componet_pressed(component_type: ComponentResBase)


func _ready() -> void:
	prompts_container_node.on_component_pressed.connect(handle_component_pressed)


func initialise_token_display(new_max_value: int) -> void:
	token_progress_bar_node.max_value = new_max_value
	token_count_label_node.text = str(0)


func update_token_display(player_tokens: int) -> void:
	token_progress_bar_node.value = player_tokens
	token_count_label_node.text = str(player_tokens)
	prompts_container_node.update_components_display(player_tokens)


func handle_component_pressed(prompt_type: ComponentResBase) -> void:
	print("%s: prompt pressed: %s" % [name, prompt_type])
	on_componet_pressed.emit(prompt_type)
