extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -2200
		for i in body.get_children():
			if i.is_in_group("launcher_particle"):
				i.emitting = true
				
		global.score += 3
		global.arrow_score += 1
