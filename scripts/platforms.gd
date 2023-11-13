extends Node2D

@onready var platforms = $"."
@onready var platform = preload("res://scenes/platform.tscn")
@onready var launcher = preload("res://scenes/launcher.tscn")
@onready var pollution = preload("res://scenes/pollution.tscn")
@onready var tree_of_zen = preload("res://scenes/tree_of_zen.tscn")
@onready var player = $"../player"
@onready var timer = $"../Timer"
@export var amount_of_platforms = 2
@export var platform_y_seperation = 260
@export var platform_x_amount = 2
@export var spawn_per_timer = 10
@export var pollution_chance = 6
@export var launcher_chance = 10
@export var zen_chance = 100
@onready var deletion_timer = $"../deletion_timer"

var spawn_location = Vector2(1,1)
var prev_platform_seperation = 0
var first_timer
var instantiated_objects = []
var can_spawn = true
var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	spawn_platform()
	difficulty()
	timer.timeout.connect(spawn_platform)

func spawn_platform():
	if player.position.y - 500 < prev_platform_seperation + 2100:
		for e in range(spawn_per_timer):
			for i in range(platform_x_amount):
				spawn_location = Vector2i(
					randi_range(0+90, width-90),
					(prev_platform_seperation + platform_y_seperation) + 720
					
				)
				
				var p = platform.instantiate()
				
				p.position = spawn_location
				if randi_range(0,launcher_chance) == 1 and can_spawn:
					var l = launcher.instantiate()
					l.position = Vector2(p.position.x+100, p.position.y-60)
					platforms.add_child(l)
					instantiated_objects.append(l)
				elif randi_range(0,pollution_chance) == 1 and can_spawn:
					var pol = pollution.instantiate()
					pol.position = Vector2(p.position.x+100, p.position.y-60)
					platforms.add_child(pol)
					instantiated_objects.append(pol)
				elif randi_range(0,zen_chance) == 1 and can_spawn:
					var zen = tree_of_zen.instantiate()
					zen.position = Vector2(p.position.x+100, p.position.y-60)
					platforms.add_child(zen)
					instantiated_objects.append(zen)
				platforms.add_child(p)
				instantiated_objects.append(p)

			prev_platform_seperation -= platform_y_seperation

			
func difficulty():
	if global.difficulty == 1:
		launcher_chance = 0
		pollution_chance = 0
	elif global.difficulty == 2:
		launcher_chance = 2
		pollution_chance = 0
	elif global.difficulty == 3:
		launcher_chance = 3
		pollution_chance = 5
	elif global.difficulty == 4:
		launcher_chance = 10
		pollution_chance = 4
	elif global.difficulty == 5:
		launcher_chance = 20
		pollution_chance = 2
	elif global.difficulty == 6:
		launcher_chance = 0
		pollution_chance = 1

