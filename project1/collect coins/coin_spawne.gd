extends Timer

var coins_scene = preload("res://coins.tscn")
func _on_timeout() -> void:
	var new_coins = coins_scene.instantiate()

	
	get_node("/root").add_child(new_coins)
	
	new_coins.position.y = -100
	new_coins.position.x = randi_range(0,1200)
	pass 
	##This part refers to the timer code in the shmup game.
