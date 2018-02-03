extends LineEdit

func _ready():
	get_parent().set_min(global.ball_spawn_min)
	get_parent().set_max(global.ball_spawn_max)
	set_text(str(global.ball_spawn_rate))

func _on_ball_rate_text_text_entered( text ):
	var num = float(text)
	if num < global.ball_spawn_min:
		num = global.ball_spawn_min
	if num > global.ball_spawn_max:
		num = global.ball_spawn_max
	global.ball_spawn_rate = num
	get_parent().set_value(num)

func _on_ball_rate_slider_value_changed( value ):
	global.ball_spawn_rate = value
	set_text(str(value))