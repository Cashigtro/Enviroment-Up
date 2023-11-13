extends ProgressBar



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var score_before = global.score
	if global.score > max_value:
		max_value = global.score
	if global.score < max_value:
		add_theme_color_override("font_color", Color(255,0,0,1))
	else:
		add_theme_color_override("font_color", Color(0,255,0,1))

	
	value = global.score
