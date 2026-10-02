class_name BattleInterface extends Control

@export var token_progress_bar_node: ProgressBar = null
@export var token_count_label_node: Label = null
@export var prompts_container_node: PromptsContainer = null

signal on_prompt_pressed(prompt_type: PromptType)


func _ready() -> void:
	prompts_container_node.on_prompt_pressed.connect(handle_prompt_pressed)


func initialise_token_display(new_max_value: int) -> void:
	token_progress_bar_node.max_value = new_max_value
	token_count_label_node.text = str(0)


func update_token_display(player_tokens: int) -> void:
	token_progress_bar_node.value = player_tokens
	token_count_label_node.text = str(player_tokens)
	prompts_container_node.update_prompts_display(player_tokens)


func handle_prompt_pressed(prompt_type: PromptType) -> void:
	print("%s: prompt pressed: %s" % [name, prompt_type])
	on_prompt_pressed.emit(prompt_type)
