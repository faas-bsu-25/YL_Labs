extends CharacterBody2D

var speed = 500
@onready var sprite = $NormalBag

func _ready() -> void:
	add_to_group("playerBag")

func _process(delta: float) -> void:
	var move = Input.get_axis("left","right")
	self.velocity.x = move*speed
	#1,This is the part where the player-controlled backpack character moves. 
	#Here, I referred to the code for controlling the spaceship's movement in the shmup practice. When I ran it for the first time, the character did not move according to the keyboard input. The reason was that I did not add the "move_and_slide" at the end.
	
	move_and_slide()
	if move !=0:
		sprite.texture = preload("res://collect coins/sprites/normal bag.png")
	else:
		sprite.texture = preload("res://collect coins/sprites/smile bag.png")
