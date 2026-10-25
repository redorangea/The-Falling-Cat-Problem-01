extends AudioStreamPlayer

@export var music: AudioStreamPlayer
@export var startup: AudioStreamPlayer
@export var mew: AudioStreamPlayer
@export var mew_timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	start_random_timer()
	startup.play()
	await get_tree().create_timer(4.5).timeout
	music.play()


func start_random_timer() -> void:
	mew_timer.wait_time = randf_range(2.0, 30.0)
	mew_timer.start()


func _on_mew_timer_timeout():
	mew.play()
	print("mew")
	start_random_timer()
