extends Control

func _ready():
	$AudioStreamPlayer2D.finished.connect(
		func play():
			$AudioStreamPlayer2D.play()
	)



func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
