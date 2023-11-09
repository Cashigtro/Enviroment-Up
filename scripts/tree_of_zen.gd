extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -3500
		
#		create_tween().tween_property(Engine, "time_scale", 0, 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
		
		global.score += 25
		global.zen_score += 1
		# the tree of zen makes you go so figh and harst and high and aswell.
