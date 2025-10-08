extends GPUParticles2D

func _ready():
	var mat = ParticleProcessMaterial.new()
	mat.initial_velocity_min = 100
	mat.initial_velocity_max = 150
	mat.spread = 180
	mat.gravity = Vector3(0, 0, 0)
	mat.scale_min = 0.5
	mat.scale_max = 1.0
	mat.color = Color(1, 0.84, 0, 1)  

	process_material = mat

	amount = 20
	lifetime = 0.5
	one_shot = true
	emitting = false
	
