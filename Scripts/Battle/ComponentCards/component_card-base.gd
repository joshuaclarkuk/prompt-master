class_name ComponentCardBase extends Button

@export_category("Required Nodes")
@export var component_texture_node: TextureRect = null
@export var component_title_node: Label = null
@export var component_cost_node: Label = null

@export_category("Component Resource")
@export var component_type: ComponentResBase = null

var is_selected: bool = false


func _ready() -> void:
	pressed.connect(handle_pressed)

	component_texture_node.texture = component_type.component_texture
	component_title_node.text = component_type.component_title
	component_cost_node.text = str(component_type.component_cost)


func handle_pressed() -> void:
	is_selected = !is_selected

	if is_selected:
		offset_transform_position = Vector2(0, -40)
		EventBus.on_component_pressed.emit(component_type, is_selected)
	else:
		offset_transform_position = Vector2.ZERO
		EventBus.on_component_pressed.emit(component_type, is_selected)

	print("%s: is_selected: %s" % [name, is_selected])


func get_component_cost() -> int:
	return component_type.component_cost


func get_is_selected() -> bool:
	return is_selected
