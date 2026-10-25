extends StaticBody2D

@export var collision: CollisionShape2D
@export var lock_box_timer: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready():
	collision.disabled = true
	visible = false
	await get_tree().create_timer(lock_box_timer).timeout
	collision.disabled = false
	visible = true
	$Bang.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_tree().has_group("key"):
		queue_free()
