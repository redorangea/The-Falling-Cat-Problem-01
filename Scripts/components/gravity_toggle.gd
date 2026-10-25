class_name GravityToggleComponent
extends Node

@export var audio: AudioStreamPlayer

#signal that gravity should be changed
#change gravity
#flip.v sprites affected by gravity in animation
#flip horizontal input
#change background shaders

var just_toggled = false

func handle_gravity_toggle(want_to_toggle: bool, able_to_toggle: bool) -> void:
	if want_to_toggle and able_to_toggle:
		Global.gravity_vector_y *= -1.0
		just_toggled = true
		audio.play()
	no_longer_toggled()

func no_longer_toggled():
	if just_toggled:
		
		await get_tree().create_timer(0.22).timeout
		just_toggled = false
