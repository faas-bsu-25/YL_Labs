extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var MOUSE_SENSITIVITY = .01
@onready var cam = $Camera3D
@onready var cam_rotator = $CamRotator
@onready var raycast = $Camera3D/RayCast3D
@onready var pickup_joint = $Camera3D/pickupjoin

var last_selected = null

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		self.rotate_y( -event.relative.x * MOUSE_SENSITIVITY)
		
		
		cam_rotator.rotate_x( -event.relative.y * MOUSE_SENSITIVITY)
		cam.rotation.x = clamp(cam_rotator.rotation.x, -.9,.9)
		cam_rotator.rotation = cam.rotation
		
		
func _process(delta: float) -> void:
	
	var selected
	
	if raycast.is_colliding():
		
		selected = raycast.get_collider()
		
		if raycast.get_collider().is_in_group("pickable"):
			selected.ray_select()
			
	if last_selected:
		if last_selected != selected and last_selected.is_in_group("pickable"):
			last_selected.ray_deslect()
			
		last_selected = selected
		
		if Input.is_action_just_pressed("interact"):
			pickup_joint.node_b = selected.get_path()
			
		if Input.is_action_just_pressed("interact"):
			pickup_joint.set_node_b("")

func _physics_process(delta: float) -> void:
	
	var player_dir = Input.get_vector("left","right","down","up")
	
	self.velocity = ((-self.transform.basis.z * player_dir.y) + (self.transform.basis.x * player_dir.x)) * SPEED
	self.velocity.y = 0
	move_and_slide()
