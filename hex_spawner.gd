extends StaticBody2D

var hex = load("res://hex.tscn")

func _ready():
	set_fixed_process(true)
	get_child(1).set_wait_time(global.hex_spawn_rate)

func _fixed_process(delta):
	get_child(1).set_wait_time(global.hex_spawn_rate)

func _on_Timer_timeout():
	if global.hexes_spawning:
		var new_hex = hex.instance()
		get_parent().add_child(new_hex)