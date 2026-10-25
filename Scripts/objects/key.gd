extends Area2D


@export var key: Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		Global.just_grabbed_key = true
		$KeyGrab.play()
		$Bang.play()
		$Sprite2D.visible = false
		await get_tree().create_timer(.18).timeout
		queue_free()
