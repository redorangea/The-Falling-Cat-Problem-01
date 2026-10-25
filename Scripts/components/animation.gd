class_name AnimationComponent
extends Node

@export_subgroup("Nodes")
@export var sprite: AnimatedSprite2D

enum States {IDLE, RUN, FALLING, FALL}

var state: States = States.IDLE

var fall_finished: bool

func handle_horizontal_flip(move_direction: float) -> void:
	if move_direction == 0:
		return
	
	sprite.flip_h = false if move_direction > 0 else true


func handle_move_animation(move_direction: float, is_falling:bool, gravity_swapped: bool) -> void:
	handle_horizontal_flip(move_direction)
	if move_direction == 0 and !is_falling:
		state = States.IDLE
	elif is_falling and gravity_swapped:
		state = States.FALLING
	elif is_falling:
		state = States.FALL
	elif move_direction != 0:
		state = States.RUN
	play_animation()

func play_animation() -> void:
	if state == States.IDLE:
		sprite.play("idle")
	elif state == States.FALLING:
		sprite.play("falling")
	elif state == States.RUN:
		sprite.play("run")
	elif state == States.FALL:
		sprite.play("fall")


func handle_gravity_toggle_animation(gravity_dir: float) -> void:
	if gravity_dir < 0:
		sprite.flip_v = true
	else:
		sprite.flip_v = false
