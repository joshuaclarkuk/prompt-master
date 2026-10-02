class_name PromptsContainer extends VBoxContainer

@export var prompt_ui_objects: Array[PromptUIObject] = []


func update_prompts_display(player_tokens: int) -> void:
    for prompt in prompt_ui_objects:
        if (player_tokens >= prompt.get_prompt_cost()):
            prompt.activate()
        else:
            prompt.deactivate()