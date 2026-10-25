extends CharacterBody2D

@export var ghost: CharacterBody2D
@export var player: CharacterBody2D
@export var sprite: Sprite2D
@export var player_sprite: AnimatedSprite2D

@export var speed: float 
var speed_mult: float = 1.0
var hunt_mode: bool = false
var active: bool

func _ready():
	active = false


func _process(delta):
	activate()
	if active:
		track_player(player, delta)
	print(active)


func track_player(player: CharacterBody2D, delta: float):
	ghost.position = ghost.position.move_toward(player.position, speed * speed_mult * delta)
	if ghost.position.x > player.position.x:
		sprite.flip_h = true
		if !player_sprite.flip_h and !hunt_mode:
			speed_mult = 0.0
		else:
			speed_mult = 1.0
	else:
		sprite.flip_h = false
		if player_sprite.flip_h and !hunt_mode:
			speed_mult = 0.0
		else:
			speed_mult = 1.0
	if get_tree().has_group("key"):
		hunt_mode = false
	else:
		hunt_mode = true


func activate():
	if !active:
		await get_tree().create_timer(1.0).timeout
		active = true
	pass
