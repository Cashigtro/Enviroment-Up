extends Area2D

var arrow_notif = preload("res://scenes/arrow_notif.tscn")
@onready var destination = $"/root/main/ui/scores/score_containers/pollution/pollution"
@onready var child_location = $"/root/main/ui/notifs"
var notif = false

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -2200
		
		if notif:
			var a = arrow_notif.instantiate()
		
			print(destination)
			
			a.position = body.position

			child_location.add_child(a)
			
			var tween = create_tween()
			tween.tween_property(a, "position", destination.position, 1)
		
		global.score += 3
		global.arrow_score += 1
