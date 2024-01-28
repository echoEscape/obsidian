extends Node2D

@export var exit_array : Array[String] = []
@export var start_pos : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_exit()

func check_exit() -> void:
	pass
