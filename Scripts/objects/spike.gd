extends Area2D


@export var flip_v: bool = false
@export var flip_h: bool = false

func _ready():
	if flip_v:
		$Sprite2D.flip_v = true
	if flip_h:
		$Sprite2D.flip_h = true
