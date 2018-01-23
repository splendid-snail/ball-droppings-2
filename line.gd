extends StaticBody2D

var start_pos = global.start_pos
var end_pos = global.end_pos
var position = [start_pos, end_pos]

func align():
	set_pos(start_pos)
	
	var length = start_pos.distance_to(end_pos)
	set_scale(Vector2(length,length))
	
	var angle = get_angle_to(end_pos)
	rotate(angle)
	
	position = [start_pos, end_pos]

func _ready():
	align()
	set_fixed_process(true)

func _fixed_process(delta):
	align()