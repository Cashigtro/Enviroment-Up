extends Node2D

@onready var platforms = $"."
@onready var platform = preload("res://scenes/platform.tscn")
@onready var launcher = preload("res://scenes/launcher.tscn")
@onready var pollution = preload("res://scenes/pollution.tscn")
@onready var tree_of_zen = preload("res://scenes/tree_of_zen.tscn")
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
@export var zen_chance = 100

var prev_platform_seperation = 0
@onready var deletion_timer = $"../deletion_timer"

var first_timer
var instantiated_objects = []

var can_spawn = true

func _ready():
	spawn_platform()
	difficulty()
	timer.timeout.connect(spawn_platform)
#	first_timer = get_tree().create_timer(0.01)
#	first_timer.timeout.connect(
#		func change_can_spawn():
#			can_spawn = true
#	)
	

func spawn_platform():
#	difficulty()
	if player.position.y - 500 < prev_platform_seperation + 2100:
		for e in range(spawn_per_timer):
			for i in range(platform_x_amount):
				spawn_location = Vector2i(
					randi_range(0+90, width-90),
					(prev_platform_seperation + platform_y_seperation) + 720
					
				)
#				var delete_timer = Timer.new()
#				delete_timer.wait_time = 10
#				delete_timer.timeout.connect(
#					func kill_platform():
#						delete_timer.get_parent().queue_free()
#						print("Deleted a platfrom")
#				)
				
				var p = platform.instantiate()
#				delete_timer.start()
#				p.add_child(delete_timer)
				
#
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
#	print(str(prev_platform_seperation) + "  " + str(player.position.y-500))
			
func difficulty():
#	print(global.difficulty)
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
#		print("SD")
		launcher_chance = 0
		pollution_chance = 1

