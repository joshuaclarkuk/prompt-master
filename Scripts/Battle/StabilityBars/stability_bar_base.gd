extends VBoxContainer

@export_category("Required Nodes")
@export var progress_bar_node: ProgressBar = null


func update_stability_bar(stability_remaining: int) -> void:
    progress_bar_node.value = stability_remaining