extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const CLIMB_SPEED = 100.0

var spawn_position: Vector2
var tilemap
func _ready():
	spawn_position = global_position  
	tilemap = get_parent().get_node("TileMap")

func _physics_process(delta: float) -> void:
	var input_x = Input.get_axis("ui_left", "ui_right")
	var input_y = Input.get_axis("ui_up", "ui_down")

	var on_ladder = is_on_ladder()

	if on_ladder:
		velocity.y = input_y * CLIMB_SPEED
		velocity.x = input_x * SPEED / 2
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if input_x:
			velocity.x = input_x * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

	$Animator.speed = self.velocity.length()
	$Animator.on_ground = is_on_floor()

	move_and_slide()  
	

func is_on_ladder() -> bool:
	var tilemap = get_parent().get_node("TileMap") 
	if not tilemap:
		return false
	var tile_pos = tilemap.local_to_map(global_position)
	var data = tilemap.get_cell_tile_data(0, tile_pos)
	if data and data.get_custom_data("ladder") == true:
		return true
	return false
	
func die():
	hide()
	set_physics_process(false)

	await get_tree().create_timer(1.0).timeout

	global_position = spawn_position
	show()
	set_physics_process(true)
