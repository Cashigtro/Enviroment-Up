extends Node2D

@onready var platforms = $"."
@onready var platform = preload("res://scenes/platform.tscn")
@onready var launcher = preload("res://scenes/launcher.tscn")
@onready var pollution = preload("res://scenes/pollution.tscn")
@onready var player = $"../player"

var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

var spawn_location = Vector2(1,1)
@onready var timer = $"../Timer"

@export var amount_of_platforms = 2
@export var platform_y_seperation = 260
@export var platform_x_amount = 2
@export var spawn_per_timer = 10
@export var pollution_chance = 6
@export var launcher_chance = 10

var prev_platform_seperation = 0
@onready var deletion_timer = $"../deletion_timer"


var instantiated_objects = []

func _ready():
	spawn_platform()
	timer.timeout.connect(spawn_platform)
	

func spawn_platform():
	if player.position.y - 500 < prev_platform_seperation+ 2100:
		for e in range(spawn_per_timer):
			for i in range(platform_x_amount):
				spawn_location = Vector2i(
					randi_range(0+90, width-90),
					(prev_platform_seperation + platform_y_seperation) + 720
					
				)
				var p = platform.instantiate()
				p.position = spawn_location
				if randi_range(0,launcher_chance) == 1:
					var l = launcher.instantiate()
					l.position = Vector2(p.position.x+100, p.position.y-60)
					platforms.add_child(l)
					instantiated_objects.append(l)
				if randi_range(0,pollution_chance) == 1:
					var pol = pollution.instantiate()
					pol.position = Vector2(p.position.x+100, p.position.y-60)
					platforms.add_child(pol)
					instantiated_objects.append(pol)
				platforms.add_child(p)
				instantiated_objects.append(p)
			

			prev_platform_seperation -= platform_y_seperation
#	print(str(prev_platform_seperation) + "  " + str(player.position.y-500))
			
