extends Node

var paused = false

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("pause"):
		if not paused:
			get_tree().set_pause(true)
			paused = true
		else:
			get_tree().set_pause(false)
			paused = false