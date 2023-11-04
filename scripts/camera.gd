extends Camera2D

@export var camera_constant_y_add_amount = 100
@onready var bg = $"../bg"
@onready var player = $"../player"

var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	position = Vector2(width/2, height/2)
	

#func _process(delta):
##	var new_position = (camera_constant_y_add_amount + (position.y - player.global_position.y / 2)) * delta 
#	var new_position = (camera_constant_y_add_amount - player.position.y) * 100 * delta
#	position.y = new_position
#	bg.position.y = new_position
#

func _physics_process(delta):
	if player.global_position.y < global_position.y:
		global_position.y = player.global_position.y
	else:
		global_position.y -= camera_constant_y_add_amount * delta
