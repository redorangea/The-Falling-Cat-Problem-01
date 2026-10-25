extends Node2D

@export var static_body: StaticBody2D
@export var trigger_area: Area2D 
@export var self_destruct_timer: Timer
@export var sprite: AnimatedSprite2D
@export var crack_sound: AudioStreamPlayer


func _on_trigger_area_body_entered(body):
	if body.is_in_group("player"):
		self_destruct_timer.start()
		sprite.play("cracking")


func _on_self_destruct_timer_timeout():
	static_body.collision_layer = 0
	static_body.collision_mask = 0
	sprite.visible = false
	crack_sound.play()
	await get_tree().create_timer(.6).timeout
	queue_free()
