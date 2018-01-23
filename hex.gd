extends RigidBody2D

var bumps = 0
var bump_limit = 2

func _ready():
	set_global_pos(global.hex_spawner_pos)
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_global_pos()
	if pos.x < global.LEFT_EDGE or pos.x > global.RIGHT_EDGE or pos.y > global.BOTTOM:
		queue_free()
		
	var pitch = (pos.y * 0.0025) 
	var pan = (pos.x * 0.0025) - 1
	
	if get_colliding_bodies().size() > 0:
		get_node("/root/Game/sound/").set_default_pitch_scale(pitch)
		get_node("/root/Game/sound/").set_default_pan(pan)
		get_node("/root/Game/sound/").play("deep_bass")
		
		bumps += 1
		if bumps > bump_limit:
			queue_free()