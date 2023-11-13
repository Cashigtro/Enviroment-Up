extends Camera2D

@export var camera_constant_y_add_amount = 100
@onready var player = $"../player"

var width = ProjectSettings.get_setting("display/window/size/viewport_width")
var height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready():
	position = Vector2(width/2, height/2)

func _physics_process(delta):
	if player.global_position.y < global_position.y:
		global_position.y = player.global_position.y
	else:
		global_position.y -= camera_constant_y_add_amount * delta
