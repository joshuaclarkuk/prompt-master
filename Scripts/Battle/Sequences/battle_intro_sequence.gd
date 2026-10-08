class_name BattleIntroSequence extends Node

@export_category("Required Nodes")
@export var player_sprite_node: Sprite2D = null
@export var enemy_sprite_node: Sprite2D = null
@export var battle_interface_node: Control = null
@export var animation_player_node: AnimationPlayer = null
@export var battle_music_node: AudioStreamPlayer = null
@export var battle_intro_sequence_timer_node: Timer = null

var battle_intro_sequence_timer_index: int = 0


func _ready() -> void:
	battle_intro_sequence_timer_node.timeout.connect(handle_appear_timer_timeout)

	player_sprite_node.visible = false
	enemy_sprite_node.visible = false
	battle_interface_node.visible = false

	call_deferred("start_battle_intro_sequence")


func start_battle_intro_sequence() -> void:
	EventBus.on_fade_from_black.emit()
	battle_music_node.play()
	battle_intro_sequence_timer_node.start()


func handle_appear_timer_timeout() -> void:
	match battle_intro_sequence_timer_index:
		0:
			# Enter player
			animation_player_node.play("player_enter_battle")
			battle_intro_sequence_timer_index += 1
			battle_intro_sequence_timer_node.start()            
		1:
			# Enter enemy
			animation_player_node.play("enemy_enter_battle")
			battle_intro_sequence_timer_index += 1
			battle_intro_sequence_timer_node.start()
		2:
			# Show battle interface
			animation_player_node.play("display_battle_interface")
			battle_intro_sequence_timer_index += 1
