extends Area2D

@export var dialog_box_path: NodePath
@export var dialog_text: String = "Thank you for saving me.!"
@onready var dialog_box := get_node(dialog_box_path)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and dialog_box:
		dialog_box.show_text(dialog_text)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player") and dialog_box:
		dialog_box.hide_text()
