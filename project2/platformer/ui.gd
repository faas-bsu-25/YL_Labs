extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlatformerGameController.coin_collected.connect(coin_collected)
	$txtCoins.text = str(PlatformerGameController.coins_collected)
	pass # Replace with function body.
	
func coin_collected():
	$txtCoins.text = str( PlatformerGameController.coins_collected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
