extends Node2D

@onready var platforms = $"."
@onready var platform = preload("res://scenes/platform.tscn")

var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

var spawn_location = Vector2(1,1)
@onready var timer = $"../Timer"


func _ready():

	timer.timeout.connect(spawn_platform)

func spawn_platform():

	spawn_location = Vector2i(
		randi_range(0, width),
		randi_range(0, height)
	)
	
	spawn_location.y = spawn_location.y - (spawn_location.y % 500)
	
	var p = platform.instantiate()
	p.position = spawn_location


	platforms.add_child(p)
