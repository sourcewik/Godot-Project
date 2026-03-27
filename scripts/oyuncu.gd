extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

var start_y = 0.0
var score = 0

func _ready():
	# get the floor
	start_y = global_position.y

func _physics_process(delta: float) -> void:
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# update height score
	calc_height()

func calc_height():
	# 1. get the raw height
	var raw_height = start_y - global_position.y
	
	# 2. apply 80% multiplier to slow it down
	# 3. no "if" check here so it follows you down too
	score = int(raw_height * 0.8)
	
	# update label
	if has_node("Camera2D/Label"):
		$Camera2D/Label.text = "skor: " + str(score)
