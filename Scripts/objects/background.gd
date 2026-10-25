extends Control

@export_subgroup("Nodes")
@export var background_toggle_component: BackgroundToggleComponent


func _process(_delta: float) -> void:
	background_toggle_component.handle_background_toggle(Global.gravity_vector_y)
