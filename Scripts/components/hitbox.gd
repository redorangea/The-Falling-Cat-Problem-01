class_name HitboxComponent
extends Node

@export var detection_area: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	detection_area.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body) -> void:
	if body.is_in_group("player"):
		Global.just_failed = true
		get_tree().reload_current_scene()
