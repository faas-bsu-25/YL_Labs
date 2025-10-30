extends AudioStreamPlayer2D

func _ready():
	if not get_tree().root.has_node("BGM"):
		name = "BGM"
		get_tree().root.add_child(self)
		play()
	else:
		queue_free()
