extends CharacterBody2D

@export var speed = 400

func walk(bool_shift:bool):
	var input_direction = Input.get_vector("left_a", "right_d", "up_w", "down_s")
	
	if bool_shift:
		speed = 750
	else:
		speed = 500

	velocity = input_direction * speed

func get_input():
	if Input.is_action_pressed("shift"):
		walk(true)
	else:
		walk(false)

func _physics_process(delta):
	get_input()
	move_and_slide()
