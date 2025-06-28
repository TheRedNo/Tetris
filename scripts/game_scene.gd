extends Node2D

@onready var currentCube = random_cube(3)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(currentCube)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Rotate"):
		currentCube.rotation_degrees += 90

func random_cube(cubeIdGive: int = 0) -> Node2D:
	var random = RandomNumberGenerator.new()
	var CubeID = random.randi_range(1, 7)
	
	var CubeMap = {
		1: "res://scenes/1x_4.tscn",
		2: "res://scenes/2x_2.tscn",
		3: "res://scenes/L.tscn",
		4: "res://scenes/L_inverted.tscn",
		5: "res://scenes/stair_left_right.tscn",
		6: "res://scenes/stair_right_left.tscn",
		7: "res://scenes/T.tscn"
	}
	
	if cubeIdGive != 0:
		var cube = load(CubeMap[cubeIdGive]).instantiate()
		return cube
	
	var cube = load(CubeMap[CubeID]).instantiate()
	return cube


func _on_falltimer_timeout() -> void:
	currentCube.position.y += 72
	if currentCube.position.y >= 1080:
		currentCube = random_cube()
		add_child(currentCube)
