extends CharacterBody2D

var speed = 200

@export var bullet_element : Resource
#var bullet_element = preload("res://shump/elements/laser.tscn")

func _process(delta: float) -> void:
	var move_dir = Input.get_axis("left","right")
	
	self.velocity.x = move_dir*speed
	
	if Input.is_action_just_pressed("shoot"):
		
		var newBullet = bullet_element.instantiate()
		
		
		get_node("/root").add_child(newBullet)
		newBullet.position = self.position
	
	
	move_and_slide()
