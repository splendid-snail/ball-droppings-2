extends LineEdit

func _ready():
	get_parent().set_min(global.hex_spawn_min)
	get_parent().set_max(global.hex_spawn_max)
	set_text(str(global.hex_spawn_rate))

func _on_hex_rate_text_text_entered( text ):
	var num = int(text)
	if num < global.hex_spawn_min:
		num = global.hex_spawn_min
	if num > global.hex_spawn_max:
		num = global.hex_spawn_max
	global.hex_spawn_rate = num
	get_parent().set_value(num)

func _on_hex_rate_slider_value_changed( value ):
	global.hex_spawn_rate = value
	set_text(str(value))
