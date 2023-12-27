extends CharacterBody3D

@export var _mouse_sensitivity: float = 0.05

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

@export var speed = 5.0

func _physics_process(delta):
	movement()
	
func movement():
	var forward_backward_velocity = Vector3.ZERO
	var left_right_velocity = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		left_right_velocity = transform.basis.x
	elif Input.is_action_pressed("move_left"):
		left_right_velocity = -transform.basis.x
	else:
		left_right_velocity = Vector3.ZERO

	if Input.is_action_pressed("move_backward"):
		forward_backward_velocity = transform.basis.z
	elif Input.is_action_pressed("move_forward"):
		forward_backward_velocity = -transform.basis.z
	else:
		forward_backward_velocity = Vector3.ZERO

	# Moving the Character
	velocity = (left_right_velocity + forward_backward_velocity) * speed
	velocity.normalized()
	move_and_slide()

func _input(event):
	_aim(event)
	
	# TODO: casting returns null or false if it fails?
	var key_input = event as InputEventKey
	if key_input:
		if key_input.as_text_keycode() == "Q":
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		if key_input.as_text_keycode() == "A":
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _aim(event: InputEvent) -> void:
	var mouse_motion = event as InputEventMouseMotion
	var key_input = event as InputEventKey
	if mouse_motion:
		rotation_degrees.y -= (mouse_motion.relative.x * _mouse_sensitivity)
		var curr_tilt = $Camera3D.rotation_degrees.x
		curr_tilt -= (mouse_motion.relative.y * _mouse_sensitivity)
		$Camera3D.rotation_degrees.x = clamp(curr_tilt, -90, 90)
