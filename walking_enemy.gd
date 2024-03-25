extends CharacterBody2D


var direction1 = Vector2.RIGHT
var velocity1 = Vector2.ZERO

@onready var LedgeCheckRight: = $LedgeCheckRight
@onready var LedgeCheckLeft: = $LedgeCheckLeft
@onready var enemysprite: = $AnimatedSprite2D

func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_ledge = not LedgeCheckRight.is_colliding() or not LedgeCheckLeft.is_colliding()
	if found_wall or found_ledge:
		direction1 *= -1
		
	
	enemysprite.flip_h = direction1.x > 0
	
	velocity = direction1 * 25
	move_and_slide()
