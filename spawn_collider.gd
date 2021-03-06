extends CollisionShape2D

var held = false

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _on_spawn_area_mouse_enter():
	global.over_spawner = true

func _on_spawn_area_mouse_exit():
	global.over_spawner = false

func _on_spawn_area_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("draw") and not global.mod_held:
		held = true
		global.grabbing_spawner = true
	
	if event.is_action_released("draw"):
		held = false
		global.grabbing_spawner = false

func _fixed_process(delta):
	global.spawner_pos = get_global_pos()
	if held:
		get_parent().get_parent().set_pos(get_global_mouse_pos())