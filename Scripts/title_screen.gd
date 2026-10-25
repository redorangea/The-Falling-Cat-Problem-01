extends Control

@onready var cat_sprite: AnimatedSprite2D = $CatSprite
var ready_to_fall:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$CRT/ColorRect.visible = true
	cat_sprite.play("run")


func _on_button_pressed():
	#cat falls
	$toggle.play()
	cat_sprite.flip_v = false
	cat_sprite.play("falling")
	ready_to_fall = true
	Global.gravity_vector_y = 1.0
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")


func _process(delta:float):
	if ready_to_fall:
		cat_sprite.position.y *= 1.025
