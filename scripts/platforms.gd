extends Node2D

@onready var platforms = $"."
@onready var platform = preload("res://scenes/platform.tscn")
@onready var player = $"../player"

var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

var spawn_location = Vector2(1,1)
@onready var timer = $"../Timer"

@export var amount_of_platforms = 2
@export var platform_y_seperation = 260
@export var platform_x_amount = 2
@export var spawn_per_timer = 10
var prev_platform_seperation = 0


func _ready():
	spawn_platform()
	timer.timeout.connect(spawn_platform)

func spawn_platform():
	for e in range(spawn_per_timer):
		for i in range(platform_x_amount):
			spawn_location = Vector2i(
				randi_range(0+90, width-90),
				(prev_platform_seperation + platform_y_seperation) + 720
				
			)
			var p = platform.instantiate()
			p.position = spawn_location
			platforms.add_child(p)


		prev_platform_seperation -= platform_y_seperation

#func spawn_platform():
#
#	spawn_location = Vector2i(
#		randi_range(0, width),
#		randi_range(0, height)
#	)
#
#	spawn_location.y = spawn_location.y - (spawn_location.y % 500)
#
#	var p = platform.instantiate()
#	p.position = spawn_location
#
#	for i in range(1):
#		print(i)
#
#	platforms.add_child(p)
