extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 100
const FRICTION = 500
var velocity = Vector2.ZERO

func _physics_process(delta):
	# if Input.is_action_pressed("ui_right"):
	#	velocity.x = 2
	# elif Input.is_action_pressed("ui_left"):
	#	velocity.x = -2
	# elif Input.is_action_pressed("ui_up"):
	#	velocity.y = -2
	# elif Input.is_action_pressed("ui_down"):
	#	velocity.y = 2
	# else:
	#	velocity.x = 0
	#	velocity.y = 0
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# make the controller speed equal to a circle
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
