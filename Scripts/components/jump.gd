class_name JumpComponent
extends Node

@export_subgroup("Settings")
@export var jump_velocity: float = -250.0 

var is_jumping: bool = false


func handle_jump(body: CharacterBody2D, want_to_jump: bool, is_grounded: bool) -> void:
	if want_to_jump and is_grounded:
		body.velocity.y = jump_velocity * Global.gravity_vector
	
	is_jumping = (body.velocity.y < 0 and !body.is_on_floor()) or body.velocity.y > 0 and !body.is_on_ceiling()
