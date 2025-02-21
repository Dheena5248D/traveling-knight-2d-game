extends CanvasLayer

@onready var score_label: Label = $ScoreLabel

func _ready():
	# Connect to the GameController's signal
	get_node("/root/GameController").connect("score_updated", Callable(self, "_on_score_updated"))
	
func _on_score_updated(new_score):
	score_label.text = "Score: " + str(new_score)
