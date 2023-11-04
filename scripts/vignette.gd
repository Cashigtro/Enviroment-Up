extends ColorRect
#
#@onready var player = $"../player"
#@onready var player_head = $"../player/head2"
#
#var current_one = "none"
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
##	var new_value = (1-Time.get_ticks_msec()/10000.0)
#
#	if current_one == "pollution":
#		var tween = create_tween()
#		tween.tween_property(material, "shader_parameter/SCALE", 0, 1)
#	elif current_one == "arrow":
#		var tween = create_tween()
#		tween.tween_property(material, "shader_parameter/SCALE", 0, 5)
#
#	self.position = player.position
##	print(new_value)
#	print(current_one)
#
#func _on_main_arrow_vs_pollution(c):
#	current_one = c
	
