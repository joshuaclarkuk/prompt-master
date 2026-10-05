class_name BattleIntroSequence extends Node

@export_category("Required Nodes")
@export var player_sprite_node: Sprite2D = null
@export var enemy_sprite_node: Sprite2D = null
@export var battle_interface_node: Control = null
@export var animation_player_node: AnimationPlayer = null
@export var battle_music_node: AudioStreamPlayer = null
@export var appear_timer_node: Timer = null

var appear_timer_index: int = 0


func _ready() -> void:
	appear_timer_node.timeout.connect(handle_appear_timer_timeout)

	player_sprite_node.visible = false
	enemy_sprite_node.visible = false
	battle_interface_node.visible = false

	call_deferred("start_battle_intro_sequence")


func start_battle_intro_sequence() -> void:
	EventBus.on_fade_from_black.emit()
	battle_music_node.play()
	appear_timer_node.start()


func handle_appear_timer_timeout() -> void:
	match appear_timer_index:
		0:
			print("%s: displaying player" % [name])
			animation_player_node.play("player_enter_battle")
			appear_timer_index += 1
			appear_timer_node.start()            
		1:
			print("%s: displaying enemy" % [name])
			animation_player_node.play("enemy_enter_battle")
			appear_timer_index += 1
			appear_timer_node.start()
		2:
			print("%s: displaying battle interface" % [name])
			animation_player_node.play("display_battle_interface")
			appear_timer_index += 1
