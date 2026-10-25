class_name GravityComponent
extends Node


@export_subgroup("Settings")
@export var gravity: float = Global.gravity
@export var gravity_vector_y: float = Global.gravity_vector_y


var is_falling: bool = false

func handle_gravity(body: CharacterBody2D, delta: float, is_grounded: bool) -> void:
	if !is_grounded:
		body.velocity.y += gravity * gravity_vector_y * delta
	
	is_falling = (body.velocity.y > 0 and !body.is_on_floor()) or (body.velocity.y < 0 and !body.is_on_ceiling())
	
	gravity_vector_y = Global.gravity_vector_y

#function that changes gravity when e is pressed

func get_grounded_status(body: CharacterBody2D, gravity_vector_y: float) -> bool:
	return true if (body.is_on_floor() and gravity_vector_y > 0) or  (body.is_on_ceiling() and gravity_vector_y < 0) else false
