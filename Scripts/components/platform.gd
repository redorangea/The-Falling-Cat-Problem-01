class_name PlatformComponent
extends Node

@export_subgroup("Settings")
@export var loop: bool = true
@export var speed: float = 2.0
@export var speed_scale: float = 1.0

@export_subgroup("Nodes")
@export var path: PathFollow2D
@export var animation: AnimationPlayer

func _ready():
	if !loop:
		animation.play("move")
		animation.speed_scale = speed_scale
		set_process(false)


func _process(delta):
	path.progress += speed * delta * speed_scale
