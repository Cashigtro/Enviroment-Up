extends Area2D


signal body_entered_zone

func _on_body_entered(body):
	body_entered_zone.emit(body)
