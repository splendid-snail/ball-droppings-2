extends CollisionShape2D

var held = false

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _on_perc_line_handle_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("draw"):
		held = true
		global.grabbing_edge = true
	
	if event.is_action_released("draw"):
		held = false
		global.grabbing_edge = false
		
	if event.is_action_pressed("rmb") and not global.mod_held:
		global.over_edge = false
		get_parent().get_parent().queue_free()

func _fixed_process(delta):
	if held:
		var mpos = get_global_mouse_pos()
		var height = mpos.y
		get_parent().get_parent().height = height

func _on_perc_line_handle_mouse_enter():
	global.over_edge = true

func _on_perc_line_handle_mouse_exit():
	global.over_edge = false