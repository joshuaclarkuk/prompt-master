class_name PromptsContainer extends VBoxContainer

@export var prompt_ui_objects: Array[PromptUIObject] = []

signal on_prompt_pressed(prompt_type: PromptType)


func _ready() -> void:
	for prompt in prompt_ui_objects:
		prompt.pressed.connect(handle_prompt_pressed.bind(prompt))


func update_prompts_display(player_tokens: int) -> void:
	for prompt in prompt_ui_objects:
		if (player_tokens >= prompt.get_prompt_cost()):
			prompt.activate()
		else:
			prompt.deactivate()


func handle_prompt_pressed(prompt: PromptUIObject) -> void:
	print("%s: pressed!" % [prompt.name])
	on_prompt_pressed.emit(prompt.prompt_type)
