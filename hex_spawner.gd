extends StaticBody2D

var hex = load("res://hex.tscn")

func _ready():
	pass
	
func _on_Timer_timeout():
	var new_hex = hex.instance()
	get_parent().add_child(new_hex)