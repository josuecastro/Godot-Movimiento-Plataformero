extends CharacterBody2D

var velocidad = 500
var gravedad = 2000
var salto = 800

var movimiento = Vector2.ZERO
	
func _physics_process(delta):
	get_input()
	movimiento.y += gravedad * delta
	set_velocity(movimiento)
	set_up_direction(Vector2.UP)
	move_and_slide()
	#movimiento = velocity
	
	if Input.is_action_just_pressed("jump"):
		#velocity.y = -180
		if is_on_floor():
			movimiento.y = -salto

func get_input():
	movimiento.x = 0
	if Input.is_action_pressed("left"):
		movimiento.x -= velocidad
	if Input.is_action_pressed("right"):
		movimiento.x += velocidad
