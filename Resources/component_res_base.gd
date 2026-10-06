class_name ComponentResBase extends Resource

enum ComponentTypes {
    TASK,
    AUDIENCE,
    CONTEXT,
    CONSTRAINTS,
    FORMAT,
}

@export var component_type: ComponentTypes = ComponentTypes.TASK
@export var component_texture: Texture2D = null
@export var component_title: String = ""
@export var component_cost: int = 0