extends Control

@onready var death_label: Label = $Label

func _ready():
	if Global.just_failed:
		$Fail.play()
	#var death_text = ["OUCH.","TRY AGAIN","..."]
	#var random_text = death_text.pick_random()
	#death_label.text = random_text


func _process(delta):
	if Global.just_failed:
		visible = true
		await get_tree().create_timer(1.0).timeout
		Global.just_failed = false
	else:
		visible = false
