extends RigidBody2D

var bumps = 0
var bump_limit = 2

var shake_ready = true
var shake_cooldown = 0
var cooldown_limit = 10

var new_spawned = true
var spawn_cooldown = 0
var spawn_cooldown_limit = 35

func _ready():
	set_global_pos(global.hex_spawner_pos)
	set_fixed_process(true)

func _fixed_process(delta):
	if new_spawned:
		spawn_cooldown += 1
	if spawn_cooldown == spawn_cooldown_limit:
		new_spawned = false
	
	var pos = get_global_pos()
	if pos.x < global.LEFT_EDGE or pos.x > global.RIGHT_EDGE or pos.y > global.BOTTOM or pos.y < global.TOP:
		queue_free()
	
	if global.gravity_flipped:
		set_gravity_scale(-1)
	else:
		set_gravity_scale(1)
	
	var pitch = (pos.y * 0.0025) 
	var pan = (pos.x * 0.0025) - 1
	
	var collides = get_colliding_bodies()
	
	if collides.size() > 0:
		for body in collides:
			if (body.is_in_group("lines") or body.is_in_group("balls")) and not new_spawned:
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