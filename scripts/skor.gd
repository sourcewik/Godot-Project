extends CharacterBody2D

var start_y = 0.0
var score = 0

func _ready():
	# set the starting point
	start_y = global_position.y

func _process(_delta):
	# calculate height based on global movement
	var current_height = start_y - global_position.y
	
	if current_height > score:
		score = int(current_height)
		# path to the label inside the camera
		$Camera2D/Label.text = "skor: " + str(score)
