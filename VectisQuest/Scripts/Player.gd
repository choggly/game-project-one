extends KinematicBody2D

const FRICTION = 500
const ACCELERATION = 500
const MAX_SPEED = 50

# Vector is an X and Y position - this will be our characters position.
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	#Makes sure diagonal movement is not faster than normal X,Y axis movement.
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationPlayer.play("RunDown")
		# If our vector doesnt equal 0, add input_vector every frame and multiply by MAX SPEED AND acceleration, followed by 
		# multiply by delta. Delta is required for our character to be relative to our frame rate.
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationPlayer.play("Idle")
		#If our character is not moving, we are adding friction(weight) to our character.
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	#Multiplied by delta, our velocity will be relative to our frame rate.
	velocity = move_and_slide(velocity)
