extends Area2D

@onready var game_controller: Node = %"game controller"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	game_controller.show_score()
	animation_player.play("pickup")
