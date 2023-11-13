extends Control

signal play_button_pressed



func _on_play_again_pressed():
	play_button_pressed.emit()
