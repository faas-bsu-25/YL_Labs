extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	PlatformerGameController.collect_key()
	self.queue_free()
	pass 
