class_name MovementComponent
extends Node

@export_subgroup("Settings")
@export var speed: float 

func handle_horizontal_movement(body: CharacterBody2D, direction: float) -> void:
	if body.is_on_floor() or body.is_on_ceiling():
		body.velocity.x = move_toward(body.velocity.x, direction * speed, 50)
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, 40)
	if body.is_on_ceiling():
		body.velocity.x 
