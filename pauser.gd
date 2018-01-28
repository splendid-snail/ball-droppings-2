extends Node

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("pause") and not global.menu_visible:
		if not global.paused:
			get_tree().set_pause(true)
			global.paused = true
		else:
			get_tree().set_pause(false)
			global.paused = false