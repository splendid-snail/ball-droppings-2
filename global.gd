extends Node

var start_pos = Vector2()
var end_pos = Vector2()
var spawner_pos = Vector2()
var hex_spawner_pos = Vector2()

var over_edge = false
var over_spawner = false
var over_hex_spawner = false
var grabbing_edge = false
var grabbing_spawner = false
var grabbing_hex_spawner = false
var drawing = false
var mod_held = false

const LEFT_EDGE = -50
const RIGHT_EDGE = 850
const BOTTOM = 650

func _ready():
	pass