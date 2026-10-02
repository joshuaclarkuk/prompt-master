class_name PromptUIObject extends Button

@export_category("Required Nodes")
@export var prompt_texture_node: TextureRect = null
@export var prompt_title_node: Label = null
@export var prompt_cost_node: Label = null

@export_category("Prompt Type Resource")
@export var prompt_type: PromptType = null

@export_category("Activation Colours")
@export var active_colour: Color = Color.WHITE
@export var inactive_colour: Color = Color8(95, 95, 95, 255)

var is_active: bool = true


func _ready() -> void:
	prompt_texture_node.texture = prompt_type.prompt_texture
	prompt_title_node.text = prompt_type.prompt_title
	prompt_cost_node.text = str(prompt_type.prompt_cost)
	deactivate()


func activate() -> void:
	if !is_active:
		disabled = false
		prompt_texture_node.modulate = active_colour
		prompt_title_node.modulate = active_colour
		prompt_cost_node.modulate = active_colour
		is_active = true
		print("%s: is_active: %s" % [name, is_active])


func deactivate() -> void:
	if is_active:
		disabled = true
		prompt_texture_node.modulate = inactive_colour
		prompt_title_node.modulate = inactive_colour
		prompt_cost_node.modulate = inactive_colour
		is_active = false
		print("%s: is_active: %s" % [name, is_active])


func get_prompt_cost() -> int:
	return prompt_type.prompt_cost
