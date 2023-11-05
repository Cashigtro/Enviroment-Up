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
@onready var score_label = $ui/score
var tween
@onready var player_move_away = $ui/anim/player_move_away
@onready var pollution_label = $ui/scores/score_containers/pollution/label
@onready var arrow_label = $ui/scores/score_containers/arrow/label
@onready var vignette = $post_processing/vignette
var shader_value = 2
@onready var red = $red
var color_value = Color(1,0,0,0)
@onready var blue = $blue

signal arrow_vs_pollution()

func _ready():
	get_tree().create_timer(1).timeout.connect(
		func timout():
			timer_done = true
	)
	$music.finished.connect(
		func play_again():
			$music.play()
	)

func _process(_delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()

	if player_on_screen.is_on_screen() == false and timer_done and player.global_position.y > camera.global_position.y:
		game_over()
	if global.score < 0:
		game_over()
	score_label.text = "Score: {}".format([global.score], "{}")
	arrow_label.text = " " + str(global.arrow_score)
	pollution_label.text = " " + str(global.pollution_score)
	
	objects_label.text = "Objects: {}".format([platforms.get_child_count()], "{}")
	
	if global.pollution_score > global.arrow_score:
		if color_value.a < 1:
			color_value.a += 0.0001
		if shader_value > 0.001:
			shader_value -= 0.001
	else:
		if color_value.a > 0:
			color_value.a -= 0.0001

		if shader_value < 2:
			shader_value += 0.001
	
	if 0.001 > shader_value:
		game_over()
	vignette.material.set_shader_parameter("SCALE", shader_value)
	vignette.position = Vector2(player.position.x - 60, player.position.y - 160)
	red.color = color_value
	red.position = player.position
	$ui/Button.pressed.connect(
		func what():
			global.pollution_score = 323
	)

func reset_scores():
	global.score = 0
	global.arrow_score = 0
	global.pollution_score = 0	

func game_over():


	game_over_screen.visible = true
	game_over_anim_player.play("in")
	player_move_away.play("shrink")
#	tween = create_tween().set_parallel(true)
#	tween.tween_property(player, "position", camera.position, 1)
#	await tween.finished
	get_tree().paused = true
	await game_over_anim_player.animation_finished
	

func _on_game_over_play_button_pressed():
	get_tree().paused = false
	reset_scores()
#	tween.kill()
	game_over_screen.visible = false
	get_tree().reload_current_scene()
