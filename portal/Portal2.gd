extends Area2D

func _on_Portal2_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://Mundo3.tscn")



