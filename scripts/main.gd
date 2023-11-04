extends Node2D
@onready var camera = $camera

@onready var bg = $bg
@onready var player = $player
@onready var player_on_screen = $player.get_child(6)
@onready var game_over_anim_player = $ui/anim/game_over_anim_player
@onready var game_over_screen = $ui/game_over
@onready var platforms = $platforms
@onready var objects_label = $ui/objects
var timer_done = false

func _ready():
	get_tree().create_timer(1).timeout.connect(
		func timout():
			timer_done = true
	)

func _process(delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	if player_on_screen.is_on_screen() == false and timer_done and player.global_position.y > camera.global_position.y:
		game_over()
		

	
#	for child in platforms.get_children():
#		if child.get_child(3).is_on_screen() == false:
#			child.queue_free()
#			await get_tree().create_timer(1)
	
	objects_label.text = "Objects: {}".format([platforms.get_child_count()], "{}")
	
func game_over():
	print("ASDAS")
	game_over_screen.visible = true
	game_over_anim_player.play("in")
	var tween = create_tween().set_parallel(true)
	tween.tween_property(player, "position", camera.position, 1)
	await tween.finished
	get_tree().paused = true
	await game_over_anim_player.animation_finished
	
	
	


func _on_game_over_play_button_pressed():
	get_tree().paused = false
	game_over_screen.visible = false
	get_tree().reload_current_scene()
