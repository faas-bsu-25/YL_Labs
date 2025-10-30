extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var state = "idle"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	#figure out what direction the player is in
	var player_dir = get_tree().get_nodes_in_group("player")[0].position - self.position
	
	print(player_dir.length())
	
	if player_dir.length() < 150:
		state = "chase"
	else:
		state = "idle"
	
	if( state == "chase"):
		self.velocity.x =  player_dir.normalized().x * SPEED 
	
	
	self.velocity.x *= .9
	move_and_slide()
	
func _on_hit_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()
