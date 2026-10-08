extends Node

# Fade screen signals
@warning_ignore("unused_signal")
signal on_fade_to_black

@warning_ignore("unused_signal")
signal on_fade_from_black


# Component pressed signals
@warning_ignore("unused_signal")
signal on_component_pressed(component_type: ComponentResBase.ComponentTypes, is_selected: bool)

# Prompt pressed signals
@warning_ignore("unused_signal")
signal on_prompt_pressed()