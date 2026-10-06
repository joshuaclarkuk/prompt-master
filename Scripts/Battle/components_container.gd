class_name ComponentsContainer extends HBoxContainer

@export var component_cards: Array[ComponentCardBase] = []

signal on_component_pressed(component_type: ComponentResBase)


func _ready() -> void:
	for component in component_cards:
		component.pressed.connect(handle_component_pressed.bind(component))


func handle_component_pressed(component: ComponentCardBase) -> void:
	on_component_pressed.emit(component.component_type)
