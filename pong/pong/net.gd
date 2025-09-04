extends Area2D



func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	get_node("/root/Node2D").inc_score()
	pass # Replace with function body.
