extends Panel

func show_text(t: String):
	$Label.text = t
	visible = true

func hide_text():
	visible = false
