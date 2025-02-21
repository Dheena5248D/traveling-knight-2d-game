extends Node
var life = 3
var score = 0 
@onready var score_text: Label = $"score text"
@onready var life_label: Label = $lifeLabel
@onready var life_label_2: Label = $lifeLabel2
@onready var life_label_3: Label = $lifeLabel3
@onready var life_label_4: Label = $lifeLabel4
@onready var life_label_5: Label = $lifeLabel5
@onready var life_label_6: Label = $lifeLabel6

func show_score():
	score += 1
	score_text.text = "you collected " + str(score) + " coins"
	print(score)
	

func can_respawn():
	print("life", life)
	life -=1
	life_label.text = "you have " + str(life) + " remaining"
	life_label_2.text = "you have " + str(life) + " remaining"
	life_label_3.text = "you have " + str(life) + " remaining"
	life_label_4.text = "you have " + str(life) + " remaining"
	life_label_5.text = "you have " + str(life) + " remaining"
	life_label_6.text = "you have " + str(life) + " remaining"

	
	if(life > 0):
		return true
	else:
		return false
