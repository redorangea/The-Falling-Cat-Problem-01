extends Path2D

@export var platform_component: PlatformComponent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	platform_component._ready()
	platform_component._process(delta)
