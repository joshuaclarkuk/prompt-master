class_name PromptType extends Resource

enum PromptTypes {
    NONE,
    BASIC_PROMPT,
    ONE_SHOT_PROMPT,
    FEW_SHOT_PROMPT,
    RETRIEVAL_AUGMENTED_GENERATION,
}

@export var prompt_type: PromptTypes = PromptTypes.NONE
@export var prompt_texture: Texture2D = null
@export var prompt_title: String = ""
@export var prompt_cost: int = 0