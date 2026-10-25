class_name ControlsComponent
extends Node

var input_horizontal: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	input_horizontal = Input.get_axis("left", "right") 


func get_jump_input() -> bool:
	return Input.is_action_just_pressed("jump")


func get_gravity_input() -> bool:
	if Global.gravity_vector_y > 0:
		return Input.is_action_just_pressed("up")
	else:
		return Input.is_action_just_pressed("down")
