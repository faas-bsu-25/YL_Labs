extends CharacterBody2D

##@export var move = Vector2(0,0)
var Velocity: Vector2 

var explorsion = preload("res://gpu_particles_2d.tscn")
func _ready() ->void:
	Velocity = Vector2(randf_range(-1, 1), randf_range(0.5, 1)).normalized() * randf_range(100, 200)
	#(Originally, I wanted the coins to fall vertically like the enemies in shmup games. However, after 
	#receiving feedback from my classmates, I changed the falling path of the coins to a random direction, 
	#thereby increasing the difficulty of the game.）
	#Velocity = Vector2(0,200) 
	##self.velocity = Vector2(0,200) 

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Velocity * delta)
	
	##1.What is the difference between move_and_collide(velocity * delta) and 
	##move_and_collide(velocity)?
	##2.After changing "move_and_collide(velocity)" to "move_and_collide
	##(velocity * delta)", the speed at which the coin falls will be much slower
	## while keeping the original values.
	
	
	if collision:
		var collider = collision.get_collider()

		if collider.is_in_group("wall"):
			Velocity = Velocity.bounce(collision.get_normal())
			
		elif collider.is_in_group("playerBag"):
			get_node("/root/collect coins").increment_score()
			var new_explorsion = explorsion.instantiate()
			get_node("/root").add_child(new_explorsion)
			new_explorsion.position = self.position
			queue_free()
			
			
