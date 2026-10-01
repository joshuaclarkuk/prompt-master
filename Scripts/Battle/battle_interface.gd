class_name BattleInterface extends Control

@export var token_progress_bar_node: ProgressBar = null
@export var token_count_label_node: Label = null


func initialise_token_display(new_max_value: int) -> void:
	token_progress_bar_node.max_value = new_max_value
	token_count_label_node.text = str(0)


func update_token_display(generated_tokens: int) -> void:
	token_progress_bar_node.value = generated_tokens
	token_count_label_node.text = str(generated_tokens)
