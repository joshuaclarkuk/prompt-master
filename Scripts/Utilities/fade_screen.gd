extends TextureRect


func _ready() -> void:
	EventBus.on_fade_to_black.connect(handle_fade_to_black)
	EventBus.on_fade_from_black.connect(handle_fade_from_black)


func handle_fade_to_black() -> void:
	modulate.a = 0.0
	var fade_tween = create_tween()
	fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 1.0).set_trans(Tween.TRANS_SINE)


func handle_fade_from_black() -> void:
	modulate.a = 1.0
	var fade_tween = create_tween()
	fade_tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 1.0).set_trans(Tween.TRANS_SINE)
