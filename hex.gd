extends RigidBody2D

var bumps = 0
var bump_limit = 2
var shake_ready = true
var shake_cooldown = 0
var cooldown_limit = 10

func _ready():
	set_global_pos(global.hex_spawner_pos)
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_global_pos()
	if pos.x < global.LEFT_EDGE or pos.x > global.RIGHT_EDGE or pos.y > global.BOTTOM:
		queue_free()
		
	var pitch = (pos.y * 0.0025) 
	var pan = (pos.x * 0.0025) - 1
	
	var collides = get_colliding_bodies()
	
	if collides.size() > 0:
		for body in collides:
			if body.is_in_group("lines") or body.is_in_group("balls"):
				get_node("/root/Game/sound/").set_default_pitch_scale(pitch)
				get_node("/root/Game/sound/").set_default_pan(pan)
				get_node("/root/Game/sound/").play("deep_bass")
				bumps += 1
				if bumps > bump_limit:
					queue_free()
			
			if body.is_in_group("percs") and shake_ready:
				get_node("/root/Game/sound/").set_default_pitch_scale(1)
				get_node("/root/Game/sound/").set_default_pan(pan)
				get_node("/root/Game/sound/").play("shake")
				shake_ready = false