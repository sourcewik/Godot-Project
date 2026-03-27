extends Node2D # <--- MAKE SURE THIS IS ON LINE 1

var high_scores = [0, 0, 0]

func update_leaderboard(final_score):
	high_scores.append(final_score)
	high_scores.sort()
	high_scores.reverse()
	
	# These paths must match your Scene Tree names exactly!
	$CanvasLayer/VBox/Top1.text = "1st: " + str(high_scores[0])
	$CanvasLayer/VBox/Top2.text = "2nd: " + str(high_scores[1])
	$CanvasLayer/VBox/Top3.text = "3rd: " + str(high_scores[2])
