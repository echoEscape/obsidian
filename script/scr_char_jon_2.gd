extends CharacterBody2D

var movement : Vector2 = Vector2()
@export var move_speed : int = 32
@export var facing : String = "down"
var talking : bool = false

func _physics_process(delta) -> void:
	if !talking:
		# Moving
		if Input.is_action_pressed("right_d"):
			facing = "right"
			movement.x = move_speed
			movement.y = 0
		elif Input.is_action_pressed("left_a"):
			facing = "left"
			movement.x = -move_speed
			movement.y = 0
		elif Input.is_action_pressed("up_w"):
			facing = "up"
			movement.x = 0
			movement.y = move_speed
		elif Input.is_action_pressed("down_s"):
			facing = "down"
			movement.x = 0
			movement.y = -move_speed
		else:
			# Idle
			pass
		
		move_and_slide()
	else:
		pass
	
	
	move_and_slide()
