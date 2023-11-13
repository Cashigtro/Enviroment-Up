extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -2200
		for i in body.get_children():
			if i.is_in_group("launcher_particle"):
				i.emitting = true
		
#		create_tween().tween_property(Engine, "time_scale", 0, 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
		
		global.score += 3
		global.arrow_score += 1
