extends KinematicBody2D

#Propiedades Generales
export var Aceleracion = 100
export var Max_Vel = 300
const salto_h = -955
const dir_up = Vector2(0,-1)
const Gravedad = 60

#Definimos la reproducción
onready var sprite = $spr_player
#Definimos la dirección a la que se dirigirá
onready var animationPlayer = $AnimationPlayer
var contadorMonedas = 0
#Para definir la velocidad
var movimiento = Vector2()
signal golpe


func _physics_process(_delta):
	#La velocidad se incremente de acuerdo a la gravedad
	movimiento.y += Gravedad
	#Detener el personaje
	var friction = false
	
	if (get_slide_collision(get_slide_count()-1)!= null):
		var obj_col = get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Gr_enemigos")):
			get_tree().change_scene("res://Game_Over.tscn")
			
	
	#Acción del jugador
	if Input.is_action_pressed("ui_right"):
		
		animationPlayer.play("walk")
		sprite.flip_h = false  #La dirección
		movimiento.x = min(movimiento.x + Aceleracion, Max_Vel)
		
		
		
		
	elif Input.is_action_pressed("ui_left"):
		
		animationPlayer.play("walk")
		sprite.flip_h = true
		movimiento.x = max(movimiento.x - Aceleracion, - Max_Vel)
		
		
		
	else:
		animationPlayer.play("idle")  #Si el personaje se queda quieto
		friction = true
		
	
	#Salte nuestro personaje
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			movimiento.y = salto_h   #Altura del salto
		if friction == true:
			movimiento.x = lerp(movimiento.x, 0, 0.5) #Determina la fricción
	else:
		if friction == true:
			movimiento.x = lerp(movimiento.x, 0, 0.01)			
		
	#El personaje, si no se oprime los botones
	movimiento = move_and_slide(movimiento,dir_up)	
	


func _on_Area2D_body_entered(body):
	pass # Replace with function body.


