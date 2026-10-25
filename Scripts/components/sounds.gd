class_name SoundsComponent
extends Node

@export var audio_stream: AudioStreamPlayer

@export var random_delay: float = randf_range(2.0, 25.0)



func play_audio() -> void:
	await get_tree().create_timer(10).timeout
	audio_stream.play
	
