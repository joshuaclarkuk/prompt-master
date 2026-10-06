class_name HealthTokenUI extends HBoxContainer

@export_category("Required Nodes")
@export var player_token_count_node: Label = null


func get_player_token_count_node() -> Label:
    return player_token_count_node