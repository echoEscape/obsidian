extends CharacterBody2D

const TILE_SIZE : int = 16

var movement : Vector2 = Vector2.ZERO
var step : int = TILE_SIZE
@export var speed : float = 20.0
@export var facing : String = "down"
var talking : bool = false

func _physics_process(delta) -> void:
	#Reset to stop sliding
	velocity = Vector2.ZERO
	speed = 20.0
	
	if !talking:
		# Moving
		if Input.is_action_pressed("right_d"):
			facing = "right"
			velocity.x = step
		if Input.is_action_pressed("left_a"):
			facing = "left"
			velocity.x = -step
		if Input.is_action_pressed("down_s"):
			facing = "down"
			velocity.y = step
		if Input.is_action_pressed("up_w"):
			facing = "up"
			velocity.y = -step
					
		if Input.is_action_pressed("shift"):
			speed *= 1.5
		
		# Idle
		if velocity == Vector2.ZERO:
			pass

		#move_and_slide() requires the variable velocity:Vector2
		velocity = velocity * speed
		move_and_slide()
	else:
		pass
	
	
	move_and_slide()
