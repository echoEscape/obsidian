extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0

@onready var onr_twist_pivot := $TwistPivot
@onready var onr_pitch_pivot := $TwistPivot/PitchPivot

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input := Vector3.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_backward")

	#Use Basis of Camera to move character with camera for WASD adjusting to where camera is looking
	apply_central_force(onr_twist_pivot.basis * input * 1200.0 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	onr_twist_pivot.rotate_y(twist_input )
	onr_pitch_pivot.rotate_x(pitch_input)
	#Limit rotation amount
	onr_pitch_pivot.rotation.x = clamp(onr_pitch_pivot.rotation.x, 
	deg_to_rad(-30),
	deg_to_rad(30))
	#Stop camera movement when you stop the mouse movement
	twist_input = 0.0
	pitch_input = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			twist_input = - event.relative.x * mouse_sensitivity
			pitch_input = - event.relative.y * mouse_sensitivity