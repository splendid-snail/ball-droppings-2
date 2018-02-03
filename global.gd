extends Node

var start_pos = Vector2()
var end_pos = Vector2()

var spawner_pos = Vector2()
var ball_spawn_rate = 2
var ball_spawn_min = 0.5
var ball_spawn_max = 8
var balls_spawning = true

var hex_spawner_pos = Vector2()
var hex_spawn_rate = 4
var hex_spawn_min = 0.5
var hex_spawn_max = 8
var hexes_spawning = true 

var over_edge = false
var over_spawner = false
var over_hex_spawner = false
var over_button = false

var grabbing_edge = false
var grabbing_spawner = false
var grabbing_hex_spawner = false
var grabbing_perc_line = false

var gravity_flipped = false

var paused = false

var menu_visible = false

var drawing = false

var mod_held = false

const LEFT_EDGE = -50
const RIGHT_EDGE = 850
const TOP = -50
const BOTTOM = 650

func _ready():
	pass