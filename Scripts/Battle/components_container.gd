class_name ComponentsContainer extends VBoxContainer

@export var component_cards: Array[ComponentCardBase] = []

signal on_component_pressed(component_type: ComponentResBase)


func _ready() -> void:
	for component in component_cards:
		component.pressed.connect(handle_component_pressed.bind(component))


func update_components_display(player_tokens: int) -> void:
	for component in component_cards:
		if (player_tokens >= component.get_prompt_cost()):
			component.activate()
		else:
			component.deactivate()


func handle_component_pressed(component: ComponentCardBase) -> void:
	print("%s: pressed!" % [component.name])
	on_component_pressed.emit(component.component_type)
