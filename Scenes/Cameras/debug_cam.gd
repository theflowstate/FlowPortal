extends Node3D

const SPEED = 8
const MOUSE_SENS = 0.004

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta):
	var input_dir = Vector3(
		int(Input.is_action_pressed("r")) - int(Input.is_action_pressed("l")),
		int(Input.is_action_pressed("u")) - int(Input.is_action_pressed("d")),
		int(Input.is_action_pressed("bw")) - int(Input.is_action_pressed("fw"))
	)
	
	position += (input_dir * SPEED * delta).rotated(Vector3.UP, rotation.y)
	
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * MOUSE_SENS
		$Camera3D.rotation.x -= event.relative.y * MOUSE_SENS
