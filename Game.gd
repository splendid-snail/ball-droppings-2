###TO DO
# change behaviour so you can draw lines when menu open (but not over menu)
# perc lines could have a limit?
# a more intuitive scale for the rate sliders
# small font & labels
# MORE controls: pitch range, clear lines/balls/all, init defaults
# make lines interactive when balls paused?
# making the screen stretchable or just bigger?
# SAVE STATES

extends Node2D

var mouse_held = false
var lines = []
var line_scene = load("res://line.tscn")
var perc_lines = []
var perc_line_scene = load("res://perc_line.tscn")
var delete = false
const WHITE = Color(1, 1, 1, 1)
const GREY = Color(0.5, 0.5, 0.5, 1)
const BLACK = Color(0, 0, 0, 1)

func draw_dotted_line(height, colour):
	var last_x = 0
	var dots_drawn = 0

	while dots_drawn < 160: #you'd need to adjust this for different screen widths...
		draw_line(Vector2(last_x, height), Vector2(last_x +5, height), colour, 1)
		last_x += 5
		dots_drawn += 1
		draw_line(Vector2(last_x, height), Vector2(last_x +5, height), BLACK, 1)
		last_x += 5
		dots_drawn +=1

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if event.is_action_pressed("mod"):
		global.mod_held = true
	if event.is_action_released("mod"):
		global.mod_held = false

	if event.is_action_pressed("draw") and not global.over_edge and not global.over_spawner and not global.over_hex_spawner and not global.menu_visible and not global.over_button:
		if not global.mod_held:
			global.drawing = true
			global.start_pos = get_global_mouse_pos()
		else:
			var perc_line_node = perc_line_scene.instance()
			add_child(perc_line_node)

	if event.is_action_released("draw") and global.drawing:
		global.drawing = false
		global.end_pos = get_global_mouse_pos()

		var line_node = line_scene.instance()
		add_child(line_node)

func _on_menu_button_pressed():
	if not global.menu_visible:
		get_node("menu_panel").show()
		global.menu_visible = true
		#global.paused = true
		#get_tree().set_pause(true)
	else:
		get_node("menu_panel").hide()
		global.menu_visible = false
		#global.paused = false
		#get_tree().set_pause(false)

func _on_menu_button_mouse_enter():
	global.over_button = true

func _on_menu_button_mouse_exit():
	global.over_button = false

func _on_flip_gravity_button_pressed():
	global.gravity_flipped = !global.gravity_flipped

func _fixed_process(delta):
	lines = []
	var kids = get_children()
	for node in kids:
		if node.is_in_group("lines") and not node.is_hidden():
			var line = node.position
			lines.append(line)

	perc_lines = []
	var perc_kids = get_children()
	for node in perc_kids:
		if node.is_in_group("percs") and not node.is_hidden():
			var perc_line = node.height
			perc_lines.append(perc_line)

	update()

func _draw():
	var pos = get_global_mouse_pos()

	for line in lines:
		draw_line(line[0], line[1], WHITE, 1)
		draw_circle(line[0], 4, WHITE)
		draw_circle(line[1], 4, WHITE)

	for perc_line_height in perc_lines:
		draw_dotted_line(perc_line_height, WHITE)

	if global.drawing:
		draw_circle(global.start_pos, 4, GREY)
		draw_line(global.start_pos, pos, GREY, 1)

	if global.mod_held and not global.drawing:
		draw_dotted_line(pos.y, GREY)