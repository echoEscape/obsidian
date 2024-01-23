extends CharacterBody2D

const TILE_SIZE : int = 16

var movement : Vector2 = Vector2.ZERO
var step : int = TILE_SIZE
@export var speed : int = 20
@export var facing : String = "down"
var talking : bool = false

func _physics_process(delta) -> void:
	#Reset to stop sliding
	movement = Vector2.ZERO
	speed = 20
	
	if !talking:
		# Moving
		if Input.is_action_pressed("right_d"):
			facing = "right"
			movement.x = step
			movement.y = 0
		elif Input.is_action_pressed("left_a"):
			facing = "left"
			movement.x = -step
			movement.y = 0
		elif Input.is_action_pressed("down_s"):
			facing = "down"
			movement.x = 0
			movement.y = step
		elif Input.is_action_pressed("up_w"):
			facing = "up"
			movement.x = 0
			movement.y = -step
		else:
			# Idle
			pass
		
		if Input.is_action_pressed("shift"):
			speed = 40
		
		#move_and_slide() requires the variable velocity:Vector2
		velocity = movement * speed
		move_and_slide()
	else:
		pass
	
	
	move_and_slide()
