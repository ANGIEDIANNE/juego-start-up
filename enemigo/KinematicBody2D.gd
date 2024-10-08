extends KinematicBody2D
#El enemigo se mueva solo

const Gravedad = 10
const Velocidad = 30
const Floor = Vector2(0,-1)

var velocity = Vector2()
var direccion = 1
func _physics_process(delta):
	velocity.x = Velocidad * direccion
	
	
	
	if direccion == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("walk")
	velocity.y += Gravedad
	velocity = move_and_slide(velocity, Floor)
	#Si detecta un muro girará
	if is_on_wall():
		direccion = direccion * - 1
		
	
	if (get_slide_collision(get_slide_count()-1)!= null):
		var obj_col = get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("player")):
			queue_free()

