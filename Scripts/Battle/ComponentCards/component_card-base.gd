class_name ComponentCardBase extends Button

@export_category("Required Nodes")
@export var component_texture_node: TextureRect = null
@export var component_title_node: Label = null
@export var component_cost_node: Label = null

@export_category("Prompt Type Resource")
@export var component_type: ComponentResBase = null

@export_category("Activation Colours")
@export var active_colour: Color = Color.WHITE
@export var inactive_colour: Color = Color8(95, 95, 95, 255)

var is_active: bool = true


func _ready() -> void:
	component_texture_node.texture = component_type.prompt_texture
	component_title_node.text = component_type.prompt_title
	component_cost_node.text = str(component_type.prompt_cost)


func activate() -> void:
	if !is_active:
		disabled = false
		component_texture_node.modulate = active_colour
		component_title_node.modulate = active_colour
		component_cost_node.modulate = active_colour
		is_active = true
		print("%s: is_active: %s" % [name, is_active])


func deactivate() -> void:
	if is_active:
		disabled = true
		component_texture_node.modulate = inactive_colour
		component_title_node.modulate = inactive_colour
		component_cost_node.modulate = inactive_colour
		is_active = false
		print("%s: is_active: %s" % [name, is_active])


func get_prompt_cost() -> int:
	return component_type.prompt_cost
