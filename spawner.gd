extends StaticBody2D

var ball = load("res://ball.tscn")

func _ready():
	pass
	
func _on_Timer_timeout():
	var new_ball = ball.instance()
	get_parent().add_child(new_ball)