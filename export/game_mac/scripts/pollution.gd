extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = 460
		global.score -= 6
		global.pollution_score += 1
