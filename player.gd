extends CharacterBody2D
class_name Player


const SPEED = 115.0
const ACCELERATION = 1050.0
const FRICTION = 1000.0
const JUMP_VELOCITY = -260.0

# sets a variable to be a shortcut for the $AnimatedSprite2D
@onready var animatedSprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		# below sets maximum gravity fall speed to 320
		velocity.y = min(velocity.y, 320)

	# Handle jump.
	if is_on_floor():
		
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	else:
		if Input.is_action_just_released("ui_accept") and velocity.y < JUMP_VELOCITY / 2:
			velocity.y = JUMP_VELOCITY / 2

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
		# this animated sprite 2d part below sets the animation run to play when x velocity is not 0 
		animatedSprite.animation = "run"
		# this if elif statement below sets the character sprite to flip horizontally if the x velocity is pos or neg to match the direction it is moving
		
		animatedSprite.flip_h = velocity.x > 0
			
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		# this animated sprite 2d part below sets the animation Idle to play when x velocity is 0 
		animatedSprite.animation = "Idle"
		
		
	move_and_slide()
