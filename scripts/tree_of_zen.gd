extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -3500
		for i in body.get_children():
			if i.is_in_group("tree_particle"):
				i.emitting = true
		
		global.score += 25
		global.zen_score += 1

