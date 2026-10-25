extends Node2D

@onready var body: CharacterBody2D = $CharacterBody2D
@onready var sprite: AnimatedSprite2D = $CharacterBody2D/AnimatedSprite2D
@export var distance: float = 100.0
@export var speed: float = 1.0
@export var oscillation: float = 10.0

@onready var starting_pos_x: float = body.global_position.x
@onready var starting_pos_y: float = body.global_position.y

var time: float = 0.0


func _process(delta):
	time += delta
	global_position.x = sin(time * speed) * distance + starting_pos_x
	global_position.y = sin(time) * oscillation + starting_pos_y
