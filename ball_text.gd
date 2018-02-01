extends LineEdit

func _ready():
	set_text(str(global.ball_spawn_dummy))
	set_fixed_process(true)

func _fixed_process(delta):
	pass


func _on_ball_rate_text_text_entered( text ):
	global.ball_spawn_dummy = int(get_text())