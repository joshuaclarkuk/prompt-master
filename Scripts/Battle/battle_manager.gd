class_name BattleScreen extends Node2D

@export_category("Required Nodes")
@export var battle_interface_node: BattleInterface = null

@export_category("Token Values")
@export var time_to_generate_token: float = 0.1
@export var generated_tokens_to_add: int = 1
@export var player_max_tokens: int = 100
@export var enemy_max_tokens: int = 100

var player_tokens: int = 0
var enemy_tokens: int = 0

var token_generation_timer: float = 0.0


func _ready() -> void:
	battle_interface_node.on_prompt_pressed.connect(handle_prompt_pressed)

	battle_interface_node.initialise_token_display(player_max_tokens)
	battle_interface_node.update_token_display(player_tokens)


func _process(delta: float) -> void:
	generate_token(delta)	


func generate_token(delta: float) -> void:
	token_generation_timer += delta
	if token_generation_timer >= time_to_generate_token:
		player_tokens = mini(player_tokens + generated_tokens_to_add, player_max_tokens)
		update_battle_interface()
		token_generation_timer = 0.0


func update_battle_interface() -> void:
	battle_interface_node.update_token_display(player_tokens)


func handle_prompt_pressed(prompt_type: PromptType) -> void:
	player_tokens -= prompt_type.prompt_cost
	print("%s: prompt pressed: %s" % [name, prompt_type])
