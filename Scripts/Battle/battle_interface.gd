class_name BattleInterface extends Control

@export var health_token_ui_node: HealthTokenUI = null

var player_token_count_label_node: Label = null


func update_token_display(player_tokens: int) -> void:
	health_token_ui_node.get_player_token_count_node().text = str(player_tokens)
