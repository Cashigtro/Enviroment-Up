extends StaticBody2D
#@onready var visible_ = $visible
#
#var can_be_deleted = false
## Called when the node enters the scene tree for the first time.
#func _ready():
#	get_tree().create_timer(2).timeout.connect(
#		func change():
#			can_be_deleted = true
#	)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if can_be_deleted and visible_.is_on_screen() == false:
#		queue_free()
