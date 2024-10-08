extends Area2D



func _on_PortalFinal_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://WIN.tscn")
