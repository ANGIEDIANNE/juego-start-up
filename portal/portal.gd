extends Area2D

export (String) var scena

func _on_portal_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://Mundo2.tscn")


