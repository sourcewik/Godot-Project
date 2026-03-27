extends Node2D

@export var player: CharacterBody2D
var start_y = 0.0

func _ready():
	if player:
		# save the starting floor
		start_y = player.global_position.y

func _process(_delta):
	if player:
		# 1. calculate raw height
		var raw_height = start_y - player.global_position.y
		
		# 2. apply the 80% multiplier
		# this makes the score rise less
		var adjusted_score = raw_height * 0.8
		
		# 3. update label (no "if" check so it goes down too)
		if has_node("Camera2D/Label"):
			$Camera2D/Label.text = "skor: " + str(int(adjusted_score))
