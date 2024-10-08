extends Node


func _on_start_TextureButton_pressed():
	get_tree().change_scene("res://mundo.tscn")
	


func _on_Stop_TextureButton_pressed():
	get_tree().quit()
