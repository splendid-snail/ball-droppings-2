extends CollisionShape2D

var held = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _input(event):
	pass

func _on_start_grab_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("draw") and not global.mod_held:
		held = true
		global.grabbing_edge = true
	if event.is_action_released("draw"):
		held = false
		global.grabbing_edge = false
	if event.is_action_pressed("rmb") and not global.mod_held:
		global.over_edge = false
		get_parent().get_parent().queue_free()

func _fixed_process(delta):
	set_global_scale(Vector2(1,1))
	if held:
		get_parent().get_parent().start_pos = get_global_mouse_pos()
	set_global_pos(get_parent().get_parent().start_pos)

func _on_start_grab_mouse_enter():
	global.over_edge = true

func _on_start_grab_mouse_exit():
	global.over_edge = false