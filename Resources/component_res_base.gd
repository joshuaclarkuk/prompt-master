class_name ComponentResBase extends Resource

enum ComponentTypes {
    TASK,
    AUDIENCE,
    CONTEXT,
    CONSTRAINTS,
    FORMAT,
}

@export var prompt_type: ComponentTypes = ComponentTypes.TASK
@export var prompt_texture: Texture2D = null
@export var prompt_title: String = ""
@export var prompt_cost: int = 0