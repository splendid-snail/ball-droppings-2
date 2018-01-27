extends RigidBody2D

var shake_ready = true
var shake_cooldown = 0
var cooldown_limit = 5

func _ready():
	set_global_pos(global.spawner_pos)
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_global_pos()
	if pos.x < global.LEFT_EDGE or pos.x > global.RIGHT_EDGE or pos.y > global.BOTTOM:
		queue_free()
	
	if not shake_ready:
		shake_cooldown += 1
	if shake_cooldown == cooldown_limit:
		shake_ready = true
	
	var pitch = (pos.y * 0.0025) + 0.5 
	var pan = (pos.x * 0.0025) - 1
	
	if get_colliding_bodies().size() > 0:
		print(get_colliding_bodies())
		for body in get_colliding_bodies():
			if body.is_in_group("lines") or body.is_in_group("balls"):
				get_node("/root/Game/sound/").set_default_pitch_scale(pitch)
				get_node("/root/Game/sound/").set_default_pan(pan)
				get_node("/root/Game/sound/").play("small_bell")
			
			if body.is_in_group("percs") and shake_ready:
				get_node("/root/Game/sound/").set_default_pitch_scale(1)
				get_node("/root/Game/sound/").set_default_pan(pan)
				get_node("/root/Game/sound/").play("shake")
				shake_ready = false