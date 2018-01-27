extends StaticBody2D

var height = 30
var mpos = Vector2()

func _ready():
	mpos = get_global_mouse_pos()
	height = mpos.y
	set_pos(Vector2(0, height))
	set_fixed_process(true)

func _fixed_process(delta):
	set_pos(Vector2(0, height))