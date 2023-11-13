extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_item("default", 0)
	add_item("null", 1)
	add_item("easy", 2)
	add_item("medium", 3)
	add_item("hard", 4)
	add_item("xtreme", 5)
	add_item("GOD", 6)
	
	item_selected.connect(change_difficulty)
	
func change_difficulty(i=0):
	print(i)
	if i != -1:
		global.difficulty = i
	
	
