extends Area2D

@export var dialog_box_path: NodePath
@export var dialog_text: String = "Thank you for saving me.!"
@export var win_panel_path: NodePath 
@onready var dialog_box := get_node(dialog_box_path)
@onready var win_panel := get_node(win_panel_path)
var has_triggered := false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and dialog_box:
		dialog_box.show_text(dialog_text)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") and dialog_box:
		dialog_box.hide_text()
		await get_tree().create_timer(2.0).timeout  
		dialog_box.hide_text()    
		win_panel.visible = true  
		get_tree().paused = true  
		 
