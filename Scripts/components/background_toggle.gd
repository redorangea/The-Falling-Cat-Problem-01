class_name BackgroundToggleComponent
extends Node

@export var background: ColorRect
@export var background_arrows: TextureRect


func handle_background_toggle(gravity_vector: float) -> void:
	var color_tween = create_tween()
	
	if gravity_vector >= 0:
		color_tween.tween_property(background, "color", Color(.05,.15,.28), 0.8) 
		background_arrows.flip_v = false
	elif gravity_vector < 0:
		color_tween.tween_property(background, "color", Color(.24,.03,.15), 0.8)  
		background_arrows.flip_v = true
