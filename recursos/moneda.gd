extends Area2D
onready var animationPlayer = $AnimationPlayer
onready var Monedas_s : AudioStreamPlayer = get_node("Monedas")

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	animationPlayer.play("idle")
	
	
	
	
	
	
	for body in bodies: 
		if body.name == "player":
			
			body.contadorMonedas +=1
			
			get_parent().remove_child(self)
			
			print(body.contadorMonedas)
			
		
