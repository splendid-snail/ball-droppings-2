extends StaticBody2D

var ball = load("res://ball.tscn")

func _ready():
	set_fixed_process(true)
	get_child(1).set_wait_time(global.ball_spawn_rate)
	
func _fixed_process(delta):
	get_child(1).set_wait_time(global.ball_spawn_rate)

func _on_Timer_timeout():
	if global.balls_spawning:
		var new_ball = ball.instance()
		get_parent().add_child(new_ball)